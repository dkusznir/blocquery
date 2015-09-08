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
    self.user = [[Datasource sharedInstance].questions valueForKey:NSStringFromSelector(@selector(user))];
    self.text = [[Datasource sharedInstance].questions valueForKey:NSStringFromSelector(@selector(text))];
    
    return self;
}

@end
