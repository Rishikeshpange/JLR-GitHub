//
//  LoginViewController.m
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()
{
    NSString *userName,*passWord;
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"login..");
    [super viewDidLoad];
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.username.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(5.0, 5.0)];
     UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.password.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(5.0, 5.0)];
    
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.view.bounds;
    maskLayer.path  = maskPath.CGPath;
    
    
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.view.bounds;
   
    maskLayer1.path =maskPath1.CGPath;
    self.username.layer.mask = maskLayer;
    self.password.layer.mask = maskLayer1;
    
    
    [self.username setBackgroundColor:[UIColor colorWithRed:14/255.0f green:26/255.0f blue:43/255.0f alpha:1]];
    [self.username.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.username.layer setBorderWidth:1.0];
    [self.username.layer setCornerRadius:0.0f];
    
    UIImageView* usernameIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(11, 12, 20, 14)];
    usernameIconImage.image = [UIImage imageNamed:@"mail"];
    UIView* usernameIconContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 39, 39)];
    //usernameIconContainer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
     usernameIconContainer.backgroundColor = [UIColor clearColor];
    [usernameIconContainer addSubview:usernameIconImage];
    
    self.username.leftViewMode = UITextFieldViewModeAlways;
    self.username.leftView = usernameIconContainer;
    
    self.username.textAlignment = NSTextAlignmentLeft;
    
    
    
    
    
    if ([self.username respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"username" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    // self.username.placeholder = @"Username";
    
    [self.password setBackgroundColor:[UIColor colorWithRed:14/255.0f green:26/255.0f blue:43/255.0f alpha:1]];
    [self.password.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.password.layer setBorderWidth:1.0];
    [self.password.layer setCornerRadius:0.0f];
    
    UIImageView* passwordIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(11, 12, 20, 17)];
    passwordIconImage.image = [UIImage imageNamed:@"lock"];
    UIView* passwordIconContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 39, 39)];
//    passwordIconContainer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
     passwordIconContainer.backgroundColor = [UIColor clearColor];
    [passwordIconContainer addSubview:passwordIconImage];
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.password.leftView = passwordIconContainer;
    
    
    self.password.placeholder = @"Password";
    self.password.textAlignment = NSTextAlignmentLeft;
    if ([self.password respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    self.LoginButton.layer.cornerRadius = 8; // this value vary as per your desire
    self.LoginButton.clipsToBounds = YES;
    self.LoginButton.backgroundColor=[UIColor colorWithRed:24/255.0f green:178/255.0f blue:175/255.0f alpha:1];
    
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginScreeb:(id)sender {
    
    userName=self.username.text;
    passWord=self.password.text;
    NSLog(@"Username : - %@",userName);
    NSLog(@"Password : - %@",passWord);
    
    /*
     
     NSLog(@"PostData: %@",post);

     NSURL *url=[NSURL URLWithString:@"http://192.168.1.104:82/WebServices/ValidateUser.svc/Validate"];
     
     NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
     
     NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
     
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
     [request setURL:url];
     [request setHTTPMethod:@"POST"];
     [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
     [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
     [request setHTTPBody:postData];
     
     NSLog(@"Request URL is: %@", request);
     
     NSError *error = [[NSError alloc] init];
     NSHTTPURLResponse *response = nil;
     NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     
     NSLog(@"Response code: %ld", (long)[response statusCode]);
     
     if ([response statusCode] >= 200 && [response statusCode] < 300)
     {
     NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
     
     NSLog(@"Response ==> %@", responseData);
     
     NSError *error = nil;
     
     BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:urlData];
     
     if (isTurnableToJSON){
     
     NSLog(@"Is Valid Json Object");
     
     }else{
     
     NSLog(@"Is not valid Json Object");
     
     }
     
     NSDictionary *jsonData = [NSJSONSerialization
     JSONObjectWithData:urlData
     options:NSJSONReadingMutableContainers
     error:&error];
     
     NSLog(@" Json data is : %@",jsonData);
     }

     */

    /*
   AppDelegate *ad = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSLog(@"Close");
    ad.authenticated = YES;
    [self dismissViewControllerAnimated:NO completion:nil];
    */
    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
    //    //self.window = [[UIApplication sharedApplication] keyWindow];
    //   // app_delegate.window.rootViewController= app_delegate.splitViewController;
    //      [self.navigationController pushViewController:app_delegate.splitViewController animated:YES];
    //
    //    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
    //self.window = [[UIApplication sharedApplication] keyWindow];
    app_delegate.window.rootViewController= vc;

    

   // [self dismissViewControllerAnimated:NO completion:nil];
}
@end
