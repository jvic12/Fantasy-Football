//
//  FantasyFootball.h
//  Test Screens
//
//  Created by Jonathan Victorino on 2/22/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import <UIKit/UIKit.h>

// This is a fantasy football player object.  It stores the selections for a particular player.
@interface FFPlayer : NSObject
- (id)init;
// Store which player is selected.
@property int mQuarterBack;
@property int mRunningBack;
@property int mWideReceiver;
@property int mTightEnd;
@property (strong, nonatomic) NSString *mPlayerName;

@end

// This is a fantasy football game object.  It stores an arrays of FFPlayer objects (2 or more) and also
// which player is the current player.
@interface FFGame : NSObject<NSURLConnectionDataDelegate>
- (id)init;
- (void)setCurrentPlayer: (int) player;
@property (strong, nonatomic) NSMutableArray *mFFPlayerArray;
@property int mCurrentPlayer;
@property (strong, nonatomic) NSString *mGameName;
@end


typedef enum XMLNode
{
    eXMLNodeRss,
    eXMLNodeFantasyFootball,
    eXMLNodeQB,
    eXMLNodeRB,
    eXMLNodeWR,
    eXMLNodeTE,
    eXMLNodePlayer,
    eXMLNodeName,
    eXMLNodePoints,
    eXMLNodeMaxDepth,
}XMLNode;


// This is the main fantasy football object which is created by the main Application controller.
// It also has mutable arrays with the possible player selections.
@interface FantasyFootball : NSObject<NSURLConnectionDataDelegate,NSXMLParserDelegate>
{
    int mNodeDepth;
    XMLNode mNodeStack[eXMLNodeMaxDepth];
}
- (id)init;

// Store the list of players
@property (strong, nonatomic) NSMutableArray *mQuarterBackArray;
@property (strong, nonatomic) NSMutableArray *mRunningBackArray;
@property (strong, nonatomic) NSMutableArray *mWideReceiverArray;
@property (strong, nonatomic) NSMutableArray *mTightEndArray;
@property (strong, nonatomic) NSMutableArray *mQuarterBackPointsArray;
@property (strong, nonatomic) NSMutableArray *mRunningBackPointsArray;
@property (strong, nonatomic) NSMutableArray *mWideReceiverPointsArray;
@property (strong, nonatomic) NSMutableArray *mTightEndPointsArray;
@property (strong, nonatomic) FFGame *mFFGame;

@end



