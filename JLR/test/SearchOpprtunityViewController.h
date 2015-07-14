//
//  SearchOpprtunityViewController.h
//  NEEV
//
//  Created by Sachin Sharma on 20/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchOpprtunityViewController : UIViewController <UIActionSheetDelegate>
- (IBAction)frmDatetext:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *myView;
- (IBAction)todatetext:(id)sender;

- (IBAction)salestext:(id)sender;
- (IBAction)ppltext:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *secondView;
- (IBAction)talukatext:(id)sender;
- (IBAction)dsenametext:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textDate;
@property (weak, nonatomic) IBOutlet UITextField *texttoDate;
@property (weak, nonatomic) IBOutlet UITextField *textsalesstages;
@property (weak, nonatomic) IBOutlet UITextField *textPpl;
@property (weak, nonatomic) IBOutlet UITextField *textTaluka;
@property (weak, nonatomic) IBOutlet UITextField *textDsename;

@end
