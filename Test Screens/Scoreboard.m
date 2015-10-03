//
//  Scoreboard.m
//  Test Screens
//
//  Created by Jonathan Victorino on 4/24/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//
#import "AppDelegate.h"
#import "InviteAFriend.h"
#import "Scoreboard.h"
#import "FantasyFootball.h"

@interface Scoreboard ()

@end

@implementation Scoreboard

@synthesize mTeamName1, mTeamName2, mQuarterBackPoints1, mQuarterBackPoints2, mRunningBackPoints1, mRunningBackPoints2, mWideReceiverPoints1, mWideReceiverPoints2, mTightEndPoints1, mTightEndPoints2,  mTotal1TextField, mTotal2TextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    FFPlayer *currentPlayer1 = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: 0];
    FFPlayer *currentPlayer2 = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: 1];
    
    int index = currentPlayer1.mQuarterBack;
    
    NSString *qb1String = [appDelegate.mFantasyFootball.mQuarterBackArray objectAtIndex: index];
    NSNumber *qb1Number = [appDelegate.mFantasyFootball.mQuarterBackPointsArray objectAtIndex: index];
    
     NSString *combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",qb1String,qb1Number];
    [mQuarterBackPoints1 setText: combinedStr];
    
    index = currentPlayer2.mQuarterBack;
    
    NSString *qb2String = [appDelegate.mFantasyFootball.mQuarterBackArray objectAtIndex: index];
    NSNumber *qb2Number = [appDelegate.mFantasyFootball.mQuarterBackPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",qb2String,qb2Number];
    [mQuarterBackPoints2 setText: combinedStr];
    
    
    index = currentPlayer1.mRunningBack;
    
    NSString *rb1String = [appDelegate.mFantasyFootball.mRunningBackArray objectAtIndex: index];
    NSNumber *rb1Number = [appDelegate.mFantasyFootball.mRunningBackPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",rb1String,rb1Number];
    [mRunningBackPoints1 setText: combinedStr];
    
    index = currentPlayer2.mRunningBack;
    
    NSString *rb2String = [appDelegate.mFantasyFootball.mRunningBackArray objectAtIndex: index];
    NSNumber *rb2Number = [appDelegate.mFantasyFootball.mRunningBackPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",rb2String,rb2Number];
    [mRunningBackPoints2 setText: combinedStr];
    
    
    index = currentPlayer1.mWideReceiver;
    
    NSString *wr1String = [appDelegate.mFantasyFootball.mWideReceiverArray objectAtIndex: index];
    NSNumber *wr1Number = [appDelegate.mFantasyFootball.mWideReceiverPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",wr1String,wr1Number];
    [mWideReceiverPoints1 setText: combinedStr];
    
    index = currentPlayer2.mWideReceiver;
    
    NSString *wr2String = [appDelegate.mFantasyFootball.mWideReceiverArray objectAtIndex: index];
    NSNumber *wr2Number = [appDelegate.mFantasyFootball.mWideReceiverPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat: @"%@-%@",wr2String,wr2Number];
    [mWideReceiverPoints2 setText: combinedStr];
    
    
    index = currentPlayer1.mTightEnd;
    
    NSString *te1String = [appDelegate.mFantasyFootball.mTightEndArray objectAtIndex: index];
    NSNumber *te1Number = [appDelegate.mFantasyFootball.mTightEndPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat:@"%@-%@", te1String,te1Number];
    [mTightEndPoints1 setText: combinedStr];
    
    
    NSString *te2String = [appDelegate.mFantasyFootball.mTightEndArray objectAtIndex: index];
    NSNumber *te2Number = [appDelegate.mFantasyFootball.mTightEndPointsArray objectAtIndex: index];
    
    combinedStr = [[NSString alloc] initWithFormat:@"%@-%@", te2String,te2Number];
    [mTightEndPoints2 setText: combinedStr];
    
    [mTeamName1 setText: currentPlayer1.mPlayerName];
    [mTeamName2 setText: currentPlayer2.mPlayerName];
    
    int total = [wr1Number intValue] + [rb1Number intValue] + [qb1Number intValue];
    combinedStr = [[NSString alloc] initWithFormat: @"%d",total];
    [mTotal1TextField setText: combinedStr];
    
    total = [wr2Number intValue] + [rb2Number intValue] + [qb2Number intValue];
    combinedStr = [[NSString alloc] initWithFormat: @"%d",total];
    [mTotal2TextField setText: combinedStr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
