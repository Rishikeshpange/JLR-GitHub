//
//  TestDrvieViewController.m
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "CreateOpportunityViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
@interface CreateOpportunityViewController ()

@end

@implementation CreateOpportunityViewController
@synthesize scroll_icons;

    UIAlertView *alert;
   // UIImageView *scroll_icons;
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    NSLog(@"Wachang");
    self.view.layer.borderColor =  [UIColor colorWithRed:(4/255.0) green:(41/255.0) blue:(82/255.0) alpha:1].CGColor;
    self.view.layer.borderWidth = 3.0f;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_strip.png"] forBarMetrics:UIBarMetricsDefault];
    
    // Navigation bar button on right side
    UIButton *btnInfo =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnInfo setImage:[UIImage imageNamed:@"icon_info.png"] forState:UIControlStateNormal];
    [btnInfo addTarget:self action:@selector(info_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnInfo setFrame:CGRectMake(-15, -5, 40, 40)];
    
    UIButton *btnLogout =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogout setImage:[UIImage imageNamed:@"icon_logout.png"] forState:UIControlStateNormal];
    [btnLogout addTarget:self action:@selector(logOut_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnLogout setFrame:CGRectMake(44, -5, 40, 40)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(10,10,90,40)];
    [rightBarButtonItems addSubview:btnInfo];
    [rightBarButtonItems addSubview:btnLogout];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    
    // textfiled placeholder image
 
    
    _txtfldLob.rightViewMode = UITextFieldViewModeAlways;
    _txtfldLob.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];

    _txtfldLob.rightView.frame = CGRectMake(0, 0, 30, 30);
    
    
    
    
    _txtfldPpl.rightViewMode = UITextFieldViewModeAlways;
    _txtfldPpl.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];
    
    _txtfldPpl.rightView.frame = CGRectMake(0, 0, 30, 30);
    
    
    
    
  _txtfldpl.rightViewMode = UITextFieldViewModeAlways;
    _txtfldpl.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];
    
    _txtfldpl.rightView.frame = CGRectMake(0, 0, 30, 30);
    
    
    
    
    
    _txtfldApp.rightViewMode = UITextFieldViewModeAlways;
    _txtfldApp.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];
    
    _txtfldApp.rightView.frame = CGRectMake(0, 0, 30, 30);
    
    
    
    
    _txtfldContact.rightViewMode = UITextFieldViewModeAlways;
   _txtfldContact.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];
    
   _txtfldContact.rightView.frame = CGRectMake(0, 0, 30, 30);
    
    
    
    
    _txtFinancer.rightViewMode = UITextFieldViewModeAlways;
    _txtFinancer.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textlist@2x.png"]];
    
    _txtFinancer.rightView.frame = CGRectMake(0, 0, 30, 30);

  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
}
-(void)logOut_btn
{
    // flag=true;
    alert = [[UIAlertView alloc] initWithTitle:@"NEEV"
                                       message:@"Do you want to Log out"
                                      delegate:self
                             cancelButtonTitle:@"No"
                             otherButtonTitles:@"Yes",nil];
    [alert show];
    //  NSLog(@"Home biscuit from Sanfrancisco");
}
// delegate mehod for uialertView

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        
        NSLog(@"David Miller");
    }
    if (buttonIndex==1) {
        NSLog(@"Glen Maxwell");
        LoginViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        //[self.navigationController pushViewController:secondViewController animated:YES];
        [self presentViewController:secondViewController animated:YES completion:nil ];
        //[self.navigationController popToRootViewControllerAnimated:TRUE];
        // [self dismissViewControllerAnimated:YES completion:nil];
        // [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
        //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark - Split view
//scroll view

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"test");

    self.scroll_icons.image=[UIImage imageNamed:@"icon_scroll.png"];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.scroll_icons.image=[UIImage imageNamed:@"icon_upscroll.png"];
    
    NSLog(@"Dhoom..");
}





- (IBAction)textpl:(id)sender {
    
    UIActionSheet *actionSheet2 = [[UIActionSheet alloc] initWithTitle:@"A"
                                                              delegate:self
                                                     cancelButtonTitle:@"B"
                                                destructiveButtonTitle:@"D"
                                                     otherButtonTitles:@"C", @"F", @"E", nil];
    
    actionSheet2.tag=nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet2 showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
        
    }
    
    
    
    else{
        
        
        [actionSheet2 showInView:self.view];
        
    }
    
    actionSheet2.tag = 3000;
    
    
}





- (IBAction)textEdit:(UITextField *)sender {
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"A"
                                                             delegate:self
                                                    cancelButtonTitle:@"B"
                                               destructiveButtonTitle:@"D"
                                                    otherButtonTitles:@"C", @"F", @"E", nil];
    
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
    }
    
    
    else{
        
        [actionSheet showInView:self.view];
        
    }
    
    actionSheet.tag = 1000;
    
    
}

- (IBAction)textPpl:(id)sender {
    
    
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle:@"A"
                                                              delegate:self
                                                     cancelButtonTitle:@"B"
                                                destructiveButtonTitle:@"D"
                                                     otherButtonTitles:@"C", @"F", @"E", nil];
    
    actionSheet1.tag=nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet1 showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
    }
    
    
    
    else{
        
        
        [actionSheet1 showInView:self.view];
        
    }
    
    actionSheet1.tag = 2000;
    
}

- (IBAction)textapp:(id)sender {
    
    
    
    UIActionSheet *actionSheet4 = [[UIActionSheet alloc] initWithTitle:@"A"
                                                              delegate:self
                                                     cancelButtonTitle:@"B"
                                                destructiveButtonTitle:@"D"
                                                     otherButtonTitles:@"C", @"F", @"E", nil];
    
    actionSheet4.tag=nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet4 showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
    }
    
    
    
    else{
        
        
        [actionSheet4 showInView:self.view];
        
    }
    
    actionSheet4.tag = 4000;
    
    
    
    
    
    
    
}

- (IBAction)textfinance:(id)sender {
    
    
    
    UIActionSheet *actionSheet4 = [[UIActionSheet alloc] initWithTitle:@"A"
                                                              delegate:self
                                                     cancelButtonTitle:@"B"
                                                destructiveButtonTitle:@"D"
                                                     otherButtonTitles:@"C", @"F", @"E", nil];
    
    actionSheet4.tag=nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet4 showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
    }
    
    
    
    else{
        
        
        [actionSheet4 showInView:self.view];
        
    }
    
    actionSheet4.tag = 5000;
}









- (IBAction)textContact:(id)sender {
    
    
    
    
    UIActionSheet *actionSheet4 = [[UIActionSheet alloc] initWithTitle:@"A"
                                                              delegate:self
                                                     cancelButtonTitle:@"B"
                                                destructiveButtonTitle:@"D"
                                                     otherButtonTitles:@"C", @"F", @"E", nil];
    
    actionSheet4.tag=7000;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet4 showFromRect:[(UITextField *)sender frame] inView:self.myview animated:YES];
    }
    
    
    
    else{
        
        
        [actionSheet4 showInView:self.view];
        
    }
    
    actionSheet4.tag = 6000;
    
    
}











@end
