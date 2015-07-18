//
//  SignUpViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/17/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "SignUpViewController.h"
#import "ViewController.h"
#import "User.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordReEnter;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation SignUpViewController

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

- (IBAction)createUser:(id)sender
{
    [self resetUsernameAndPasswordBorders];
    
    User *user = [[User alloc] init];
    user.username = self.username.text;
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    NSString *passwordReEnter = self.passwordReEnter.text;
    NSString *email = self.email.text;
    
    if (username.length > 0 && password.length > 0 && [password isEqualToString:passwordReEnter] && email.length > 0)
    {
        User *user = (User *)[PFUser object];
        
        [user setUsername:username];
        [user setPassword:password];
        [user setEmail:email];
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
             if (!error)
             {
                 NSLog(@"User Saved!");
             }
             
             else
             {
                 NSLog(@"%@", error);
             }
        }];
        
        ViewController *viewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainView"];
        [self presentViewController:viewVC animated:YES completion:nil];
    }
    
    else
    {
        [self requiredFieldsAlert];
    }
    
}

- (IBAction)cancelSignUp:(id)sender
{
    [self resetTextFields];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resetTextFields
{
    self.username.text = nil;
    self.password.text = nil;
    self.passwordReEnter.text = nil;
    self.email.text = nil;
}

- (void)passwordsDoNotMatchWarning
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Passwords Do Not Match!", @"Passwords Do Not Match Title") message:NSLocalizedString(@"Passwords do not match. Please re-enter your password.", @"Passwords Do Not Match Message") preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"OK CLICKED");
    }];
    
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)requiredFieldsAlert
{
    if (self.username.text.length == 0 && self.password.text.length != 0 && self.passwordReEnter.text.length != 0 && self.email.text.length != 0)
    {
        [self usernameWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username Required!", @"Username Required Title") message:NSLocalizedString(@"Please enter username.", @"Username Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    else if (self.username.text.length == 0 && self.password.text.length == 0 && self.passwordReEnter.text.length != 0 && self.email.text.length != 0)
    {
        [self usernameWarning];
        [self passwordWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username & Password Required!", @"Username & Password Required Title") message:NSLocalizedString(@"Please enter username and password.", @"Username & Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length != 0 && self.passwordReEnter.text.length == 0 && self.email.text.length != 0)
    {
        [self passwordReEnterWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Re-enter Password!", @"Re-Enter Password Title") message:NSLocalizedString(@"Please re-enter password.", @"Re-enter Password Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length == 0 && self.passwordReEnter.text.length == 0 && self.email.text.length != 0)
    {
        [self passwordWarning];
        [self passwordReEnterWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Password Required!", @"Password Required Title") message:NSLocalizedString(@"Please enter a password.", @"Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length != 0 && self.passwordReEnter.text.length != 0 && self.email.text.length == 0)
    {
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Email Required!", @"Email Required Title") message:NSLocalizedString(@"Please enter a valid email address.", @"Email Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length != 0 && self.passwordReEnter.text.length == 0 && self.email.text.length == 0)
    {
        [self passwordReEnterWarning];
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Email and Password Required!", @"Email and Password Required Title") message:NSLocalizedString(@"Please enter a valid email address and confirm your password.", @"Email and Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length == 0 && self.passwordReEnter.text.length == 0 && self.email.text.length == 0)
    {
        [self passwordWarning];
        [self passwordReEnterWarning];
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Email and Password Required!", @"Email and Password Required Title") message:NSLocalizedString(@"Please enter a valid email address and password.", @"Email and Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length != 0 && self.password.text.length == 0 && self.passwordReEnter.text.length != 0 && self.email.text.length == 0)
    {
        [self passwordWarning];
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Email and Password Required!", @"Email and Password Required Title") message:NSLocalizedString(@"Please enter a valid email address and password.", @"Email and Password Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else if (self.username.text.length == 0 && self.password.text.length != 0 && self.passwordReEnter.text.length != 0 && self.email.text.length == 0)
    {
        [self usernameWarning];
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username and Email Required!", @"Username and Email Required Title") message:NSLocalizedString(@"Please enter a valid username and email address.", @"Username and Email Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else
    {
        [self usernameWarning];
        [self passwordWarning];
        [self passwordReEnterWarning];
        [self emailWarning];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Username, Password & Email Required!", @"Username, Password & Email Required Title") message:NSLocalizedString(@"Please enter a valid username, password and email.", @"Username, Password & Email Required Message") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK CLICKED");
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)resetUsernameAndPasswordBorders
{
    [self.username setBorderStyle:UITextBorderStyleLine];
    self.username.layer.borderWidth = 1;
    self.username.layer.cornerRadius = 5;
    self.username.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.password setBorderStyle:UITextBorderStyleLine];
    self.password.layer.borderWidth = 1;
    self.password.layer.cornerRadius = 5;
    self.password.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.passwordReEnter setBorderStyle:UITextBorderStyleLine];
    self.passwordReEnter.layer.borderWidth = 1;
    self.passwordReEnter.layer.cornerRadius = 5;
    self.passwordReEnter.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.email setBorderStyle:UITextBorderStyleLine];
    self.email.layer.borderWidth = 1;
    self.email.layer.cornerRadius = 5;
    self.email.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)usernameWarning
{
    [self.username setBorderStyle:UITextBorderStyleLine];
    self.username.layer.borderWidth = 1;
    self.username.layer.cornerRadius = 5;
    self.username.layer.borderColor = [[UIColor redColor] CGColor];
}

- (void)passwordWarning
{
    [self.password setBorderStyle:UITextBorderStyleLine];
    self.password.layer.borderWidth = 1;
    self.password.layer.cornerRadius = 5;
    self.password.layer.borderColor = [[UIColor redColor] CGColor];
}

- (void)passwordReEnterWarning
{
    [self.passwordReEnter setBorderStyle:UITextBorderStyleLine];
    self.passwordReEnter.layer.borderWidth = 1;
    self.passwordReEnter.layer.cornerRadius = 5;
    self.passwordReEnter.layer.borderColor = [[UIColor redColor] CGColor];
}

- (void)emailWarning
{
    [self.email setBorderStyle:UITextBorderStyleLine];
    self.email.layer.borderWidth = 1;
    self.email.layer.cornerRadius = 5;
    self.email.layer.borderColor = [[UIColor redColor] CGColor];
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
