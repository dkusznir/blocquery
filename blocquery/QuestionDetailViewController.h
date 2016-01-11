//
//  RespondViewController.h
//  blocquery
//
//  Created by Dorian Kusznir on 10/13/15.
//  Copyright © 2015 dkusznir. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DidSaveResponseWithText <NSObject>

- (void)respondedWithText:(NSString *)text;

@end

@interface QuestionDetailViewController : UIViewController

@property (nonatomic, weak) id <DidSaveResponseWithText> delegate;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSArray *questionAnswers;

//- (id)initWithQuestion:(NSString *)question;

@end
