//
//  LoginViewController.m
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RequestDelegate.h"
#import "TBXML.h"

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
    
    self.username.text=@"SJAIN_10102";
    self.password.text=@"HPY151NWYR";
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

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Authetication_Found:) name:@"authenticationFound" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"authenticationFound" object:nil];//abhishek // For opportunity Count
        
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
    
    [self callAuthentication];
    
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
//    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
//    //    //self.window = [[UIApplication sharedApplication] keyWindow];
//    //   // app_delegate.window.rootViewController= app_delegate.splitViewController;
//    //      [self.navigationController pushViewController:app_delegate.splitViewController animated:YES];
//    //
//    //    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
//    //self.window = [[UIApplication sharedApplication] keyWindow];
//    app_delegate.window.rootViewController= vc;

    

   // [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)callAuthentication
{
//    SJAIN_10102
    NSLog(@"\n\n ");
    NSString *envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<soapenv:Header>"
                              @"<UsernameToken xmlns=\"http://siebel.com/webservices\">%@</UsernameToken>"
                              @"<PasswordText xmlns=\"http://siebel.com/webservices\">%@</PasswordText>"
                              @"</soapenv:Header>"
                              @"<soapenv:Body>"
                              @"<asi:SiebelEmployeeQueryByExample soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<SiebelMessage xsi:type=\"emp:ListOfEmployeeInterfaceTopElmt\" xmlns:emp=\"http://www.siebel.com/xml/Employee%%20Interface\">"
                              @"<ListOfEmployeeInterface xsi:type=\"emp:ListOfEmployeeInterface\">"
                              @"<Employee xsi:type=\"emp:ArrayOfEmployee\">"
                              @"<LoginName xsi:type=\"ns0:string\">%@</LoginName>"
                              @"<EmploymentStatus xsi:type=\"ns0:string\">ACTIVE</EmploymentStatus>"
                              @"</Employee>"
                              @"</ListOfEmployeeInterface>"
                              @"</SiebelMessage>"
                              @"</asi:SiebelEmployeeQueryByExample>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",self.username.text,self.password.text,self.username.text];
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.75:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    
    NSLog(@"URL IS %@",theurl);
    NSLog(@"REQUEST IS %@",envelopeText);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"authenticationRequest"];
    
}

-(void)Authetication_Found:(NSNotification*)notification
{
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    
    if ([response rangeOfString:@"SOAP-ENV:Fault"].location != NSNotFound )
    {
       // [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Something Went Wrong. Please try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
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

          NSLog(@"\nResponse....%@",response);
        
    }
}


@end
