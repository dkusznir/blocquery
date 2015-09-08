//
//  QuestionTableViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/20/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "QuestionTableViewController.h"
#import "LogInViewController.h"
#import "Datasource.h"
#import "User.h"
#import "Question.h"

@interface QuestionTableViewController ()

@end

@implementation QuestionTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"New User"] == YES)
    {
        LogInViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInView"];
        [self presentViewController:loginVC animated:YES completion:nil];
        
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell" forIndexPath:indexPath];
    cell.textLabel.text = [[[self items] objectAtIndex:indexPath.row] valueForKey:@"text"];

    return cell;
}

- (NSArray *)items
{
    __block NSArray *questions = [NSArray array];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"New User"] == NO)
    {
        questions = [Datasource sharedInstance].existingQuestions;
        return questions;
    }
    
    else
    {
        questions = [Datasource sharedInstance].questions;
        return questions;
    }
    
    return 0;
}

- (IBAction)logOut:(id)sender
{
    [User logOutInBackgroundWithBlock:^(NSError *error) {
        if (error)
        {
            NSLog(@"%@", error);
        }
        
        else
        {
            NSLog(@"Log out successful!");
        }
    }];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"New User"];

    LogInViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInView"];
    [self presentViewController:loginVC animated:YES completion:nil];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
