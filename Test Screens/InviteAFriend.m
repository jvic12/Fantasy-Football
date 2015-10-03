//
//  InviteAFriend.m
//  Test Screens
//
//  Created by Jonathan Victorino on 2/22/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//
#import "InviteAFriend.h"
#import "AppDelegate.h"
#import "FantasyFootball.h"

@interface InviteAFriend ()

@end

@implementation InviteAFriend

@synthesize mQuarterBackTextField, mRunningBackTextField, mWideRecieverTextField, mTightEndTextField, mPlayerNameTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    FFPlayer *currentPlayer = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: appDelegate.mFantasyFootball.mFFGame.mCurrentPlayer];
    
    
    int index = currentPlayer.mQuarterBack;
    
    NSString *qbString = [appDelegate.mFantasyFootball.mQuarterBackArray objectAtIndex: index];
    [mQuarterBackTextField setText: qbString];
    
    
    index = currentPlayer.mRunningBack;
    
    NSString *rbString = [appDelegate.mFantasyFootball.mRunningBackArray objectAtIndex: index];
    [mRunningBackTextField setText: rbString];
    
    
    index = currentPlayer.mWideReceiver;
    
    NSString *wrString = [appDelegate.mFantasyFootball.mWideReceiverArray objectAtIndex: index];
    [mWideRecieverTextField setText: wrString];
    
    
    index = currentPlayer.mTightEnd;
    
    NSString *teString = [appDelegate.mFantasyFootball.mTightEndArray objectAtIndex: index];
    [mTightEndTextField setText: teString];
}

- (IBAction)doSend:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    int currentPlayer = appDelegate.mFantasyFootball.mFFGame.mCurrentPlayer;
    FFPlayer *currentPlayer1 = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: 0];
    FFPlayer *currentPlayer2 = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: 1];
    
    if (currentPlayer == 0)
    {
        currentPlayer1.mPlayerName = mPlayerNameTextField.text;
        appDelegate.mFantasyFootball.mFFGame.mCurrentPlayer++; // Now player 1 will be the current player
        [self performSegueWithIdentifier:@"ToCreateAGame" sender:sender];
    }
    else
    {
        currentPlayer2.mPlayerName = mPlayerNameTextField.text;
        [self performSegueWithIdentifier:@"ToCurrentGames" sender:sender];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
