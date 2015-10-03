//
//  CurrentGames.m
//  Test Screens
//
//  Created by Jonathan Victorino on 3/13/14.
//  Copyright (c) 2014 Jonathan Victorino. All rights reserved.
//

#import "CurrentGames.h"


@interface CurrentGames ()

@end

@implementation CurrentGames

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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    
    NSString *cellText = [NSString stringWithFormat: @"%@-%d", @"Test", indexPath.row];
    
    /*AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication].delegate];
    
    NSString *cellText = appDelegate.mFantasyFootball.mFFGame.mGameName;*/
    
    cell.textLabel.text = cellText;
    
    return cell;

}

@end
