//
//  Scoreboard.h
//  Test Screens
//
//  Created by Jonathan Victorino on 4/24/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Scoreboard : UIViewController

@property (assign) IBOutlet UITextField *mTeamName1;
@property (assign) IBOutlet UITextField *mTeamName2;
@property (assign) IBOutlet UITextField *mQuarterBackPoints1;
@property (assign) IBOutlet UITextField *mQuarterBackPoints2;
@property (assign) IBOutlet UITextField *mRunningBackPoints1;
@property (assign) IBOutlet UITextField *mRunningBackPoints2;
@property (assign) IBOutlet UITextField *mWideReceiverPoints1;
@property (assign) IBOutlet UITextField *mWideReceiverPoints2;
@property (assign) IBOutlet UITextField *mTightEndPoints1;
@property (assign) IBOutlet UITextField *mTightEndPoints2;
@property (assign) IBOutlet UITextField *mTotal1TextField;
@property (assign) IBOutlet UITextField *mTotal2TextField;

@end
