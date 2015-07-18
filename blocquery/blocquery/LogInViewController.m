//
//  LogInViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/17/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "LogInViewController.h"
#import "SignUpViewController.h"
#import "User.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *logIn;
@property (weak, nonatomic) IBOutlet UIButton *signUp;

@end

@implementation LogInViewController

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
- (IBAction)signUp:(id)sender
{
    SignUpViewController *signUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpView"];
    [self presentViewController:signUpVC animated:YES completion:nil];
}

- (IBAction)logIn:(id)sender
{
    [self resetUsernameAndPasswordBorders];
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    if (username.length > 0 && password.length > 0)
    {
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (user)
            {
                NSLog(@"User found!");
            }
            
            else
            {
                NSLog(@"%@", error);
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Log In Credentials Invalid", @"Log In Credentials Invalid Title") message:NSLocalizedString(@"Please check log in credentials and try again.", @"Log In Credentials Invalid Message") preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    NSLog(@"OK CLICKED");
                }];
                
                [alert addAction:confirm];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
    
    }
    
    else
    {
        if (username.length == 0 && password.length != 0)
        {
            //Username Red Border
            [self.username setBorderStyle:UITextBorderStyleLine];
            self.username.layer.borderWidth = 1;
            self.username.layer.cornerRadius = 5;
            self.username.layer.borderColor = [[UIColor redColor] CGColor];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username Required!", @"Username Required Title") message:NSLocalizedString(@"Username is required.", @"Username Required Message") preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"OK CLICKED");
            }];
            
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        
        else if (username.length != 0 && password.length == 0)
        {
            //Password Red Border
            [self.password setBorderStyle:UITextBorderStyleLine];
            self.password.layer.borderWidth = 1;
            self.password.layer.cornerRadius = 5;
            self.password.layer.borderColor = [[UIColor redColor] CGColor];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Password Required!", @"Password Required Title") message:NSLocalizedString(@"Password is required.", @"Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"OK CLICKED");
            }];
            
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
        else
        {
            //Username Red Border
            [self.username setBorderStyle:UITextBorderStyleLine];
            self.username.layer.borderWidth = 1;
            self.username.layer.cornerRadius = 5;
            self.username.layer.borderColor = [[UIColor redColor] CGColor];
            
            //Password Red Border
            [self.password setBorderStyle:UITextBorderStyleLine];
            self.password.layer.borderWidth = 1;
            self.password.layer.cornerRadius = 5;
            self.password.layer.borderColor = [[UIColor redColor] CGColor];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username and Password Required!", @"Username and Password Required Title") message:NSLocalizedString(@"Username and password are required.", @"Username and Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"OK CLICKED");
            }];
            
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

- (void)resetUsernameAndPasswordBorders
{
    [self.username setBorderStyle:UITextBorderStyleLine];
    self.username.layer.borderWidth = 1;
    self.username.layer.cornerRadius = 5;
    self.username.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.password setBorderStyle:UITextBorderStyleNone];
    self.password.layer.borderWidth = 1;
    self.password.layer.cornerRadius = 5;
    self.password.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
