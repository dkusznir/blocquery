//
//  CreateQuestions.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/31/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Parse/Parse.h>

@interface CreateQuestions : XCTestCase

@end

@implementation CreateQuestions

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuestions
{
    PFObject *question4 = [PFObject objectWithClassName:@"Question"];
    
    question4[@"text"] = @"this is a test";
    question4[@"user"] = @"johnny coder";
    
    [question4 saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
        if (success)
        {
            NSLog(@"Success");
        }
        
        else
        {
            NSLog(@"%@", error);
        }
    }];
    
}

- (void)testQuestions2
{
    PFObject *question2 = [PFObject objectWithClassName:@"Question"];
    
    question2[@"text"] = @"coding rocks";
    question2[@"user"] = @"johnny coder";
    
    [question2 saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
        if (success)
        {
            NSLog(@"Success");
        }
        
        else
        {
            NSLog(@"%@", error);
        }
    }];
    
}

- (void)testQuestion3
{
    PFObject *question3 = [PFObject objectWithClassName:@"Question"];
    
    question3[@"text"] = @"i like summertime.";
    question3[@"user"] = @"johnny coder";
    
    [question3 saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
        if (success)
        {
            NSLog(@"Success");
        }
        
        else
        {
            NSLog(@"%@", error);
        }
    }];
}

- (void)testQuestion4
{
    PFObject *question4 = [PFObject objectWithClassName:@"Question"];
    
    question4[@"text"] = @"hello world";
    question4[@"user"] = @"johnny coder";
    
    [question4 saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
        if (success)
        {
            NSLog(@"Success");
        }
        
        else
        {
            NSLog(@"%@", error);
        }
    }];
    
}
@end
