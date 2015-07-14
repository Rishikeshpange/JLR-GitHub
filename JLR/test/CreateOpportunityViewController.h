//
//  TestDrvieViewController.h
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface CreateOpportunityViewController : UIViewController<UISplitViewControllerDelegate,UIActionSheetDelegate>
// Create Opprotunity Fields
@property (weak, nonatomic) IBOutlet UITextField *textfirst;
@property (weak, nonatomic) IBOutlet UITextField *textlast;
@property (weak, nonatomic) IBOutlet UITextField *textnumber;




// Create Opprotunity Action 


@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIImageView *scroll_icons;

// Opportunity Details Fileds
@property (weak, nonatomic) IBOutlet UITextField *txtfldLob;
@property (weak, nonatomic) IBOutlet UITextField *txtfldpl;
@property (weak, nonatomic) IBOutlet UITextField *txtfldPpl;
@property (weak, nonatomic) IBOutlet UITextField *txtfldApp;
@property (weak, nonatomic) IBOutlet UITextField *txtfldContact;
@property (weak, nonatomic) IBOutlet UITextField *txtFinancer;
@property (weak, nonatomic) IBOutlet UIView *myview;


// Opportunity Detials Actions: 
- (IBAction)textpl:(id)sender;
- (IBAction)textEdit:(UITextField *)sender;
- (IBAction)textPpl:(id)sender;
- (IBAction)textapp:(id)sender;
- (IBAction)textfinance:(UITextField *)sender;
- (IBAction)textContact:(id)sender;


@end
