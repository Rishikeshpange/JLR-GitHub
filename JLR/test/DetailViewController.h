//
//  DetailViewController.h
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, XYPieChartDataSource, XYPieChartDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

{
    NSMutableArray *testArray;
    NSMutableArray *testLeadsArray;
    
}

@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;




@property (strong, nonatomic) IBOutlet XYPieChart *pieChartRight;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel1;
@property (strong, nonatomic) IBOutlet UILabel *selectedSliceLabel;
@property (strong, nonatomic) IBOutlet UITextField *numOfSlices;
@property (strong, nonatomic) IBOutlet UISegmentedControl *indexOfSlices;
@property (strong, nonatomic) IBOutlet UIButton *downArrow;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;


@property (weak, nonatomic) IBOutlet UITableView *todaysActivities_TV;// Todays Activity View

@property (weak, nonatomic) IBOutlet UITableView *Leads_TV;

@property (weak, nonatomic) IBOutlet UIButton *allleads;

@property (weak, nonatomic) IBOutlet UIButton *openleads;

@property (weak, nonatomic) IBOutlet UIButton *leadsassigned;


- (IBAction)btnallleads:(id)sender;
- (IBAction)btnleadsassigned:(id)sender;
- (IBAction)btnopenleads:(id)sender;


@property (assign) CGPoint originalCenter;


@property (weak, nonatomic) IBOutlet UITextField *searchleadTxtfld;


@end
