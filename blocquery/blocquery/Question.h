//
//  Question.h
//  blocquery
//
//  Created by Dorian Kusznir on 8/13/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSArray *answers;
@property (nonatomic, assign) NSInteger views;

- (NSArray *)availableQuestions;
- (void)saveAnswer;
//- (void)addResponse:(NSString *)response;

@end
