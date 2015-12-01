//
//  RespondViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 10/13/15.
//  Copyright © 2015 dkusznir. All rights reserved.
//

#import "RespondViewController.h"

@interface RespondViewController ()

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation RespondViewController
/*
- (id)initWithQuestion:(NSString *)question
{
    if (self)
    {
        self = [super init];
        self.questionText.text = question;
        
        return self;
    }
    
    return 0;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.questionText.text = self.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelPressed:(id)sender
{
    NSLog(@"----Cancel Pressed----");
    
    [self.navigationController popViewControllerAnimated:YES];
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
