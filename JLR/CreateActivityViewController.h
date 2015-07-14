//
//  CreateActivityViewController.h
//  NEEV
//
//  Created by Sachin Sharma on 26/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateActivityViewController : UIViewController <UIActionSheetDelegate>
- (IBAction)textYType:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UITextField *textDate;
@property (weak, nonatomic) IBOutlet UITextField *textfieldType;
@property (weak, nonatomic) IBOutlet UITextField *textTime;
- (IBAction)textDate:(id)sender;
- (IBAction)textTime:(id)sender;

@end
