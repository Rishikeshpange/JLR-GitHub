//
//  DetailViewController.m
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "dashboardTodaysActivity_Cell_VC.h"
#import "dasboard_Email_tableCell_VC.h"
#import "Dashboard_Leads_tablecell_VC.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DetailViewController
{
    UIAlertView *alert;
    
    
    }
@synthesize pieChartLeft = _pieChartCopy;
NSMutableArray *testArray;
NSMutableArray *testLeadsArray;

int *flag;

//  @synthesize pieChartLeft = _pieChartCopy;
@synthesize todaysActivities_TV;

@synthesize Leads_TV;
@synthesize percentageLabel = _percentageLabel;
#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    flag = 0;

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
    
    
    
    
    
    
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * blah = [NSNumber numberWithInt:50];
    _slices= [NSMutableArray arrayWithObjects: blah, blah,blah,blah, nil];
    
    
    
    //    for(int i = 0; i < 5; i ++)
    //    {
    //        NSNumber * blah = [NSNumber numberWithInt:i];
    //        NSArray * items = [NSArray arrayWithObjects: blah, blah, nil];
    //
    //        NSNumber *one = [NSNumber numberWithInt:rand()%60+0];
    //        [_slices addObject:one];
    //    }
    //    [self.pieChartLeft setFrame:CGRectMake(-20,0, 100, 100)];
    [self.pieChartLeft setDataSource:self];
    [self.pieChartLeft setStartPieAngle:M_PI_2];
    [self.pieChartLeft setAnimationSpeed:1.0];
    [self.pieChartLeft setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartLeft setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartLeft setPieBackgroundColor:[UIColor blackColor]];
    [self.pieChartLeft setPieCenter:CGPointMake(120, 110)];
    [self.pieChartLeft setUserInteractionEnabled:NO];
    [self.pieChartLeft setLabelShadowColor:[UIColor blackColor]];
    [self.pieChartLeft setLabelRadius:0];
    
    [[self.percentageLabel layer] setCornerRadius:61.0f];
    [[self.percentageLabel layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor blackColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:NO];
    [self.pieChartRight setLabelShadowColor:[UIColor blackColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    
    
    
    
    
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidUnload
{
       [super viewDidUnload];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    testArray = [NSMutableArray arrayWithObjects:@"test1",@"test 2",@"test 3",@"test 4",@"test 5",@"test 6", nil]; // For Activity Tab
    
    testLeadsArray = [NSMutableArray arrayWithObjects:@"test1",@"test 2",@"test 3",@"test 4",@"test 5", nil];
    
    self.todaysActivities_TV.dataSource = self;
    self.todaysActivities_TV.delegate = self;
    self.todaysActivities_TV.backgroundColor = [UIColor clearColor];
    
    self.Leads_TV.dataSource = self;
    self.Leads_TV.delegate = self;
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [self.pieChartLeft reloadData];
    
    [self.pieChartRight reloadData];
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
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
    NSLog(@"Home biscuit from Sanfrancisco");
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
          //  [self.navigationController popToRootViewControllerAnimated:TRUE];
            // [self dismissViewControllerAnimated:YES completion:nil];
           //  [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
          //  [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
}
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
    
}

- (UIColor*)pieChart:(XYPieChart*)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.todaysActivities_TV) {
        return 1;
    }
       return 0 ;
    //return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.todaysActivities_TV) {
        return [testArray count];
    }
    
    if (tableView == self.Leads_TV) {
        return 1;
    }
   
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.todaysActivities_TV) {
        static NSString *MyIdentifier = @"TodaysActivitiesViewCellIdentifier";
        
        dashboardTodaysActivity_Cell_VC *cell = [self.todaysActivities_TV dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[dashboardTodaysActivity_Cell_VC alloc] initWithStyle:UITableViewCellStyleDefault
                                                          reuseIdentifier:MyIdentifier];
        }
        cell.lbl_activityPerson.text = @"Vishwas Roy";
        cell.lbl_activityType.text = @"Test Drive :";
        cell.lbl_activitySummary.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
        cell.lbl_activityTime.text = @"9 AM";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    if (tableView == self.Leads_TV) {
        
        static NSString *MyIdentifier = @"LeadsIdentifier";
        Dashboard_Leads_tablecell_VC *cell = [self.Leads_TV dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[Dashboard_Leads_tablecell_VC alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:MyIdentifier];
        }
        
        
        if (flag==0) {
            cell.lbl_leadName.text = @"Warm Lead";
            cell.lbl_leadSummary.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ";
            cell.backgroundColor = [UIColor clearColor];
            return cell;

        }
        else if (flag==1) {
        cell.lbl_leadName.text = @"Cold Lead";
        cell.lbl_leadSummary.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
        }
        else if (flag==2){
            cell.lbl_leadName.text = @"Assigned Lead";
            cell.lbl_leadSummary.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ";
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        
        
        
    }
    
    
    
    return 0;
    
}









- (IBAction)btnallleads:(id)sender {
    
    flag =1;
    
    self.allleads.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.openleads.backgroundColor=[UIColor clearColor];
    
    self.leadsassigned.backgroundColor=[UIColor clearColor];
}

- (IBAction)btnleadsassigned:(id)sender {
    flag=2;
    
    self.leadsassigned.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.openleads.backgroundColor=[UIColor clearColor];
    
    self.allleads.backgroundColor=[UIColor clearColor];
}

- (IBAction)btnopenleads:(id)sender {
   
    flag=0;
    
    self.openleads.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.allleads.backgroundColor=[UIColor clearColor];
    
    self.leadsassigned.backgroundColor=[UIColor clearColor];
}
@end
