//
//  Datasource.h
//  blocquery
//
//  Created by Dorian Kusznir on 7/20/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datasource : NSObject <NSKeyedArchiverDelegate>

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSArray *existingQuestions;

@end
