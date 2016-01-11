//
//  RespondViewController.m
//  blocquery
//
//  Created by Dorian Kusznir on 10/13/15.
//  Copyright © 2015 dkusznir. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "QuestionDetailTableViewCell.h"

@interface QuestionDetailViewController () <UITextFieldDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextView *responseText;
@property (weak, nonatomic) IBOutlet UITableView *responsesView;

@end

@implementation QuestionDetailViewController
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
    
    self.responseText.text = @"Enter Response Here.";
    self.responseText.delegate = self;
    self.questionText.text = self.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.responsesView.delegate = self;
    self.responsesView.dataSource = self;
    [super viewWillAppear:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.questionAnswers > 0)
    {
        return self.questionAnswers.count;
    }
    
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionDetailTableViewCell *cell = (QuestionDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Response" forIndexPath:indexPath];
    
    if (self.questionAnswers > 0)
    {
        cell.answersToQuestion.text = [self.questionAnswers objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (IBAction)cancelPressed:(id)sender
{
    NSLog(@"----Cancel Pressed----");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitPressed:(id)sender
{
    NSLog(@"----Submit Pressed----");
    
    if ([self.responseText.text isEqualToString:@""])
    {
        //Alert user.
    }
    
    else
    {
        NSLog(@"Submit Worked");
        //[self.delegate respondedWithText:self.responseText.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.responseText.text = @"";
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.responseText.text isEqualToString:@""])
    {
        self.responseText.text = @"Enter Response Here.";
    }
    
    [self.responseText resignFirstResponder];
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
