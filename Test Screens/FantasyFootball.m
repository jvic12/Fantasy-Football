//
//  FantasyFootball.m
//  Test Screens
//
//  Created by Jonathan Victorino on 2/22/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//


#import "FantasyFootball.h"

#define LOCAL_RSS_FILE 1

@implementation FFPlayer

@synthesize mQuarterBack,mRunningBack,mWideReceiver, mTightEnd, mPlayerName;

- (id)init
{
    mQuarterBack = 0;
    mRunningBack = 0;
    mWideReceiver = 0;
    mTightEnd = 0;
    return self;
}

@end

@implementation FFGame
static int s_game_count = 0;
@synthesize mFFPlayerArray,mCurrentPlayer,mGameName;
- (id)init
{
    mFFPlayerArray = [[NSMutableArray alloc] init];
    mCurrentPlayer = 0;
    mGameName = [NSString stringWithFormat:@"Game-%d", s_game_count++];
    
    // Add two players
    FFPlayer *player = [[FFPlayer alloc] init];
    [mFFPlayerArray addObject: player];
    player = [[FFPlayer alloc] init];
    [mFFPlayerArray addObject: player];
    return self;
}

- (void)setCurrentPlayer: (int) player
{
    mCurrentPlayer = player;
}

@end






@implementation FantasyFootball
// Store the list of players
@synthesize mQuarterBackArray,mRunningBackArray,mWideReceiverArray, mTightEndArray, mFFGame, mQuarterBackPointsArray,mRunningBackPointsArray, mWideReceiverPointsArray, mTightEndPointsArray;

// Store which player is selected.
/*@synthesize mQuarterBack,mRunningBack,mWideReceiver, mFFGame;*/

- (id)init
{
    mQuarterBackArray = [[NSMutableArray alloc] init];
    mRunningBackArray = [[NSMutableArray alloc] init];
    mWideReceiverArray = [[NSMutableArray alloc] init];
    mTightEndArray = [[NSMutableArray alloc] init];
    mQuarterBackPointsArray = [[NSMutableArray alloc] init];
    mRunningBackPointsArray = [[NSMutableArray alloc] init];
    mWideReceiverPointsArray = [[NSMutableArray alloc] init];
    mTightEndPointsArray = [[NSMutableArray alloc] init];
    
#if LOCAL_RSS_FILE
    [self getRSSContent:@"https://s3-us-west-1.amazonaws.com/jonathan-v/test_new.rss" delegate:self];
    /*
     [self getRSSContent:@"Users/jonathanvictorino/Downloads/test_new.rss" delegate:self];
     */
#else 
    [self getRSSContent:@"https://s3-us-west-1.amazonaws.com/jpfishers3/test.rss"  delegate: self];
#endif
    mFFGame = [[FFGame alloc] init];
    
    return self;
}


-(NSURLConnection *)getRSSContent:(NSString *)url delegate:(id<NSURLConnectionDataDelegate>)delegate
{
    NSLog(@"getRSSContent:: \n %@", url);
#if LOCAL_RSS_FILE
    NSURL *urlRef = [NSURL URLWithString: url];
#else
    NSURL *urlRef = [NSURL fileURLWithPath:url];
#endif
    NSURLRequest *rssRequest = [NSURLRequest requestWithURL:urlRef];
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:rssRequest delegate:delegate startImmediately:YES];
    return connect;
}


- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"Received data:: \n %@",newStr );
    
    [self parseRssXML:data];
}



-(void) parseRssXML:(NSData *)xmldata
{
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmldata];
    mNodeDepth = 0;
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities:NO];
    [xmlParser parse];
}



- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"didStartElement:: %@, %@, %@, %d\n ",elementName, namespaceURI, qName, mNodeDepth);
    if([elementName isEqualToString:@"rss"])
        mNodeStack[mNodeDepth] = eXMLNodeRss;
    else if([elementName isEqualToString:@"fantasyfootball"])
        mNodeStack[mNodeDepth] = eXMLNodeFantasyFootball;
    else if([elementName isEqualToString:@"qb"])
        mNodeStack[mNodeDepth] = eXMLNodeQB;
    else if([elementName isEqualToString:@"rb"])
        mNodeStack[mNodeDepth] = eXMLNodeRB;
    else if([elementName isEqualToString:@"wr"])
        mNodeStack[mNodeDepth] = eXMLNodeWR;
    else if([elementName isEqualToString:@"te"])
        mNodeStack[mNodeDepth] = eXMLNodeTE;
    else if([elementName isEqualToString:@"player"])
        mNodeStack[mNodeDepth] = eXMLNodePlayer;
    else if([elementName isEqualToString:@"name"])
        mNodeStack[mNodeDepth] = eXMLNodeName;
    else if([elementName isEqualToString:@"points"])
        mNodeStack[mNodeDepth] = eXMLNodePoints;
    
    mNodeDepth++;
    
    if (mNodeDepth == eXMLNodeMaxDepth)
        [parser abortParsing];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (mNodeDepth == 0)
        [parser abortParsing];
    mNodeDepth--;
    NSLog(@"didEndElement:: %@, %@, %@, %d\n ",elementName, namespaceURI, qName, mNodeDepth);
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"foundCharacters:: %@, %d\n ",string,mNodeDepth);
    if (mNodeDepth == 5)
    {
        if (mNodeStack[4] == eXMLNodeName)
        {
            switch (mNodeStack[2])
            {
                case eXMLNodeQB:
                    [mQuarterBackArray addObject:string];
                    break;
                case eXMLNodeRB:
                    [mRunningBackArray addObject:string];
                    break;
                case eXMLNodeWR:
                    [mWideReceiverArray addObject:string];
                    break;
                case eXMLNodeTE:
                    [mTightEndArray addObject:string];
                    break;
                default:
                    [parser abortParsing];
                    break;
            }
        }
        else if (mNodeStack[4] == eXMLNodePoints)
        {
            switch (mNodeStack[2])
            {
                case eXMLNodeQB:
                    [mQuarterBackPointsArray addObject:[[NSNumber alloc] initWithInteger: [string integerValue]]];
                    break;
                case eXMLNodeRB:
                    [mRunningBackPointsArray addObject:[[NSNumber alloc] initWithInteger: [string integerValue]]];
                    break;
                case eXMLNodeWR:
                    [mWideReceiverPointsArray addObject:[[NSNumber alloc] initWithInteger: [string integerValue]]];
                    break;
                case eXMLNodeTE:
                    [mTightEndPointsArray addObject:[[NSNumber alloc] initWithInteger: [string integerValue]]];
                    break;
                default:
                    [parser abortParsing];
                    break;
            }
        }
    }
}


@end





