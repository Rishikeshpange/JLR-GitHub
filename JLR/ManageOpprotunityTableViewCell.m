//
//  ManageOpprotunityTableViewCell.m
//  NEEV
//
//  Created by Sachin Sharma on 11/07/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "ManageOpprotunityTableViewCell.h"

@implementation ManageOpprotunityTableViewCell

@synthesize lbl_LeadCreationDate,
lbl_LeadCreationDateResult,
lbl_LeadId,
lbl_LeadIdResult,lbl_Product_NameResult,lbl_ProductName;

- (void)awakeFromNib {
    // Initialization code
    
    // NSLog(@"testing label..123");
    [lbl_LeadCreationDate sizeToFit];
    [lbl_LeadCreationDateResult sizeToFit];
    [lbl_LeadId sizeToFit];
    [lbl_LeadIdResult sizeToFit];
    [lbl_Product_NameResult sizeToFit];
    [lbl_ProductName sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
