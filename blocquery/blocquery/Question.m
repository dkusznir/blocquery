//
//  Question.m
//  blocquery
//
//  Created by Dorian Kusznir on 8/13/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "Question.h"
#import "Datasource.h"

@implementation Question

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.user = [[self availableQuestions] valueForKey:NSStringFromSelector(@selector(user))];
        self.text = [[self availableQuestions] valueForKey:NSStringFromSelector(@selector(text))];
        self.answers = [[self availableQuestions] valueForKey:NSStringFromSelector(@selector(answers))];
    }
    
    return self;
}

- (NSArray *)availableQuestions
{
    NSArray *questions = [Datasource sharedInstance].questions;
    
    return questions;
}

- (void)saveAnswer
{
    PFObject *object = (PFObject *)self;
    [[Datasource sharedInstance] saveAnswer:object];
}

/*
- (void)addResponse:(NSString *)response
{
    NSMutableArray *array = [self.answers mutableCopy];
    [array addObject:response];
    [[Datasource sharedInstance] saveAnswer];
    
    self.answers = array;

}
*/


@end
