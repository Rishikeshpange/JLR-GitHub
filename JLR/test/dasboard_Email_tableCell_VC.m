//
//  dasboard_Email_tableCell_VC.m
//  test
//
//  Created by Admin on 05/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "dasboard_Email_tableCell_VC.h"

@implementation dasboard_Email_tableCell_VC



@synthesize lbl_activityid,
lbl_activityType,
lbl_activityidresult,
lbl_activitytyperesult;

- (void)awakeFromNib {
    // Initialization code
    
    // NSLog(@"testing label..123");
    [lbl_activityid sizeToFit];
    [lbl_activityType sizeToFit];
    [lbl_activityidresult sizeToFit];
    [lbl_activitytyperesult sizeToFit];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end


