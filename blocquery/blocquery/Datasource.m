//
//  Datasource.m
//  blocquery
//
//  Created by Dorian Kusznir on 7/20/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import "Datasource.h"
#import <Parse/Parse.h>
#import "Question.h"

@implementation Datasource 

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"New User"] == YES)
    {
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                self.questions = objects;
                [PFObject pinAllInBackground:self.questions];
                NSLog(@"[Datasource.m] Questions count: %lu", (unsigned long)self.questions.count);
                
            }
            
            else
            {
                NSLog(@"%@", error);
            }
        }];
    }
    
    else
    {
        [query fromLocalDatastore];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                self.questions = objects;
                NSLog(@"%@", self.questions);
                
            }
            
            else
            {
                NSLog(@"%@", error);
            }
        }];

    }

    return self;
}

@end
