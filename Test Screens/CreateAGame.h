//
//  CreateAGame.h
//  Test Screens
//
//  Created by Jonathan Victorino on 2/11/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateAGame : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (assign) IBOutlet UIPickerView *QBPicker;
@property (assign) IBOutlet UIPickerView *RBPicker;
@property (assign) IBOutlet UIPickerView *WRPicker;
@property (assign) IBOutlet UIPickerView *TEPicker;
@property (assign) IBOutlet UITextField *mGameName;
@end
