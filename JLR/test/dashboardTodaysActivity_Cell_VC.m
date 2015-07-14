//
//  dashboardTodaysActivity_Cell_VC.m
//  test
//
//  Created by Admin on 04/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//
#import "dashboardTodaysActivity_Cell_VC.h"

@implementation dashboardTodaysActivity_Cell_VC

@synthesize lbl_activityPerson,
lbl_activitySummary,
lbl_activityTime,
lbl_activityType;

- (void)awakeFromNib {
    // Initialization code
    
    // NSLog(@"testing label..123");
    [lbl_activityPerson sizeToFit];
    [lbl_activitySummary sizeToFit];
    [lbl_activityTime sizeToFit];
    [lbl_activityType sizeToFit];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
