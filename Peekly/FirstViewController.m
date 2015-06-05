//
//  FirstViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/3/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "FirstViewController.h"
#import "HMSegmentedControl.h"

@interface FirstViewController ()
{
    
    NSMutableArray *titlearray;
    NSMutableArray *subtitlearray;
    
}
@end

@implementation FirstViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [_comm_priv_View setAutoresizesSubviews:TRUE];
    
    
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGRect newFrame = _comm_priv_View.frame;
    newFrame.size.width = width;
    [_comm_priv_View setFrame:newFrame];
    
    
    
    
    titlearray = [[NSMutableArray alloc]initWithObjects:@"One", @"two", @"three", nil];
    subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
    
    //Create the communication and private feature to switch
    CGRect Rect= self.view.bounds;
    float widthScreen = Rect.size.width;
    

    /*CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat viewWidth = screenRect.size.width;*/
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Community", @"Private"]];
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(72/255.0) green:(167/255.0) blue:(192/255.0) alpha:1]};
    segmentedControl.verticalDividerEnabled = YES;
    segmentedControl.verticalDividerColor = [UIColor grayColor];
    segmentedControl.verticalDividerWidth = 1.0f;
    segmentedControl.frame = CGRectMake(0, 0, widthScreen, 40);
    [segmentedControl setAutoresizingMask:                                            UIViewAutoresizingFlexibleTopMargin|
     UIViewAutoresizingFlexibleBottomMargin];
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.comm_priv_View addSubview:segmentedControl];

    
    //[self setNeedsStatusBarAppearanceUpdate];

}


-(void)awakeFromNib {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(72/255.0) green:(167/255.0) blue:(192/255.0) alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams" size:28], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
}



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titlearray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    cell.textLabel.text = [titlearray objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [subtitlearray objectAtIndex:indexPath.row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TAMU.jpg"]]; //changing every background cell to be this image
    imageView.alpha = 0.5; //opacity of the cell
    cell.backgroundView = imageView; //setting the cell to be this image
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *value = [titlearray objectAtIndex:indexPath.row];
    NSString *selected = @"You've selected row ";
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:[selected stringByAppendingString:value] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
    [messageAlert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentController:(id)sender {
    UISegmentedControl *toggleNav = (UISegmentedControl *)sender;
    if (toggleNav.selectedSegmentIndex == 1) {
        _firstView.text = @"Private";
        titlearray = [[NSMutableArray alloc]initWithObjects:@"Private Friend 1", @"Private Friend 2", @"Private Friend 3",nil];
        subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1 friend", @"2 friend", @"3 friend", nil];
        [self.tableView reloadData];
    }
    else {
        _firstView.text = @"community";
        titlearray = [[NSMutableArray alloc]initWithObjects:@"One", @"two", @"three",nil];
        subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
        [self.tableView reloadData];
    }

}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 1) {
        titlearray = [[NSMutableArray alloc]initWithObjects:@"Private Friend 1", @"Private Friend 2", @"Private Friend 3",nil];
        subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1 friend", @"2 friend", @"3 friend", nil];
        [self.tableView reloadData];
    }
    else {
        _firstView.text = @"community";
        titlearray = [[NSMutableArray alloc]initWithObjects:@"One", @"two", @"three",nil];
        subtitlearray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
        [self.tableView reloadData];
    }

}

@end
