//
//  Datasource.h
//  blocquery
//
//  Created by Dorian Kusznir on 7/20/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datasource : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSArray *questions;

@end
