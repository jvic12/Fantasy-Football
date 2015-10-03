//
//  InviteAFriend.h
//  Test Screens
//
//  Created by Jonathan Victorino on 2/22/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InviteAFriend : UIViewController
@property (assign) IBOutlet UITextField *mQuarterBackTextField;
@property (assign) IBOutlet UITextField *mRunningBackTextField;
@property (assign) IBOutlet UITextField *mWideRecieverTextField;
@property (assign) IBOutlet UITextField *mTightEndTextField;
- (IBAction)doSend:(id)sender;
@property (assign) IBOutlet UITextField *mPlayerNameTextField;
@end
