//
//  QuestionCellTableViewCell.h
//  blocquery
//
//  Created by Dorian Kusznir on 9/8/15.
//  Copyright (c) 2015 dkusznir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UIButton *respondButton;
@property (weak, nonatomic) IBOutlet UILabel *numberOfResponses;

@end
