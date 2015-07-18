//
//  ViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/9/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "LogInViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logOut;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![User currentUser])
    {
        NSLog(@"NEW USER");
        LogInViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInView"];
        [self presentViewController:loginVC animated:YES completion:nil];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    LogInViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInView"];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
