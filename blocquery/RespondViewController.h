//
//  RespondViewController.h
//  blocquery
//
//  Created by Dorian Kusznir on 10/13/15.
//  Copyright © 2015 dkusznir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RespondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (strong, nonatomic) NSString *text;

//- (id)initWithQuestion:(NSString *)question;

@end
