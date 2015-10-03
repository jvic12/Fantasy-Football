//
//  CreateAGame.m
//  Test Screens
//
//  Created by Jonathan Victorino on 2/11/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import "CreateAGame.h"
#import "AppDelegate.h"


@implementation CreateAGame

@synthesize QBPicker, RBPicker, WRPicker, mGameName;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark PickerView Data Source


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (pickerView == QBPicker)
        return appDelegate.mFantasyFootball.mQuarterBackArray.count;
    else if(pickerView == RBPicker)
        return appDelegate.mFantasyFootball.mRunningBackArray.count;
    else if (pickerView == WRPicker)
        return appDelegate.mFantasyFootball.mWideReceiverArray.count;
    else
        return appDelegate.mFantasyFootball.mTightEndArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSMutableArray *array;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    if (pickerView == QBPicker)
        array = appDelegate.mFantasyFootball.mQuarterBackArray;
    else if (pickerView == RBPicker)
        array = appDelegate.mFantasyFootball.mRunningBackArray;
    else if (pickerView == WRPicker)
        array = appDelegate.mFantasyFootball.mWideReceiverArray;
    else
        array = appDelegate.mFantasyFootball.mTightEndArray;
    NSString *theString =  [array objectAtIndex:row];
    return theString;
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    FFPlayer *currentPlayer = [appDelegate.mFantasyFootball.mFFGame.mFFPlayerArray objectAtIndex: appDelegate.mFantasyFootball.mFFGame.mCurrentPlayer];
    if (pickerView == QBPicker)
        currentPlayer.mQuarterBack = row;
    else if (pickerView == RBPicker)
        currentPlayer.mRunningBack = row;
    else if (pickerView == WRPicker)
        currentPlayer.mWideReceiver = row;
    else
        currentPlayer.mTightEnd = row;
    
    /*appDelegate.mFantasyFootball.mGameName = mGameName.text;*/
}

/*- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // The text shown in the component is just the number of the component.
	NSString *text = [NSString stringWithFormat:@"%d", row];
	
	// Where to set the text in depends on what sort of view it is.
	//UILabel *theLabel = [UILabel alloc];
    UILabel *subLabel = [[UILabel alloc] initWithFrame:view.frame];
    
	subLabel.text = text;
    return subLabel;
    //[view addSubview:subLabel];
	//return view;
    
}
*/



@end
