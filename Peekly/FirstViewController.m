//
//  FirstViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/3/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "FirstViewController.h"
#import "HMSegmentedControl.h"
#import "MyGroupsTableCell.h"

@interface FirstViewController ()
{
    
    NSMutableArray *titlearray;
    NSMutableArray *subtitlearray;
    
    NSMutableArray *groupTitleNames;
    NSMutableArray *groupTitleImages;
    
    
    NSMutableArray *commGroupTitleNames;
    NSMutableArray *commGroupTileImages;
    
    
    NSMutableArray *privGroupTitleNames;
    NSMutableArray *privGroupTitleImages;
    
    UIBarButtonItem *closeButton;
    
    int populateTableViewIndex;
    
    float widthScreen;
    
}
@end

@implementation FirstViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //Adding "addGroup" button for private
    closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addGroupFunction)];
    closeButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = nil;
    
    //Miscellaneous
    [_comm_priv_View setAutoresizesSubviews:TRUE];
    populateTableViewIndex = 0;
    
    //Set the width of the screen/frame
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGRect newFrame = _comm_priv_View.frame;
    newFrame.size.width = width;
    [_comm_priv_View setFrame:newFrame];
    
    //Initialize the comm and priv group titles *******BACKEND POPULATED******
    commGroupTitleNames = [[NSMutableArray alloc]initWithObjects:@"Baseball", @"Basketball", @"Beach Relaxing", @"Boating", @"Camping", @"Cars", @"Football", nil];
    commGroupTileImages = [[NSMutableArray alloc]initWithObjects:@"Baseball_GroupTile.png", @"Basketball_GroupTile.png", @"BeachRelaxing_GroupTile.png", @"Boating_GroupTile.png", @"Camping_GroupTile.png", @"Cars_GroupTile.png", @"Football_GroupTile.png", nil];
    
    privGroupTitleNames = [[NSMutableArray alloc]initWithObjects:@"Golf", @"Mountain Activities", @"Offroad Activites", @"Shopping", @"Snow Activities", @"Water Activities", nil];
    privGroupTitleImages = [[NSMutableArray alloc]initWithObjects:@"Golf_GroupTile.png", @"MountainActivities_GroupTile.png", @"OffroadActivities_GroupTile.png", @"ShoppingCart_GroupTile.png", @"Snow_GroupTile.png", @"WaterActivities_GroupTile.png", nil];
    groupTitleNames = commGroupTitleNames;
    groupTitleImages = commGroupTileImages;
    
    //Create the communication and private feature to switch
    CGRect Rect= self.view.bounds;
     widthScreen = Rect.size.width;
    
    //Segmented Controller
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Community", @"Private"]];
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:(73/255.0) green:(158/255.0) blue:(255/255.0) alpha:1];
    segmentedControl.selectionIndicatorHeight = 1.5f;
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(73/255.0) green:(158/255.0) blue:(255/255.0) alpha:1]};
    
    segmentedControl.verticalDividerEnabled = YES;
    segmentedControl.verticalDividerColor = [UIColor grayColor];
    segmentedControl.verticalDividerWidth = 1.0f;
    segmentedControl.frame = CGRectMake(0, 0, widthScreen, 40);
    [segmentedControl setAutoresizingMask:                                            UIViewAutoresizingFlexibleTopMargin|
     UIViewAutoresizingFlexibleBottomMargin];
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.comm_priv_View addSubview:segmentedControl];

    

}


-(void)awakeFromNib {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(73/255.0) green:(158/255.0) blue:(255/255.0) alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
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
    return[groupTitleNames count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        
        static NSString *simpleTableIdentifier = @"MyGroupsTableCell";
        MyGroupsTableCell *cell = (MyGroupsTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyGroupsTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.nameLabel.adjustsFontSizeToFitWidth = YES;//Makes sure the font size readjusts size
        cell.nameLabel.text = [groupTitleNames objectAtIndex:indexPath.row]; //Name of group label
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[groupTitleImages objectAtIndex:indexPath.row]]]; //Group label image
        imageView.frame = CGRectMake(0, 0, widthScreen, 80);
        imageView.alpha = 1.0; //opacity of the cell
        cell.backgroundView = imageView; //setting the cell to be this image
        cell.pointsLabel.text = @"+1000"; //Group points label (Must add the + in front"
        cell.pointsLabel.adjustsFontSizeToFitWidth = YES; //Makes sure the font size readjusts the size
    
        return cell;
    
    
    
    
    
}

-(void)addGroupFunction {
    
    [self performSegueWithIdentifier:(@"addGroup") sender:self];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Hard coded to check the titleArray array to get the row selected
    NSString *value = [commGroupTitleNames objectAtIndex:indexPath.row];
    NSString *selected = @"You've selected row ";
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:[selected stringByAppendingString:value] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
    [messageAlert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 1) {
        self.navigationItem.rightBarButtonItem = closeButton;
        groupTitleNames = privGroupTitleNames;
        groupTitleImages = privGroupTitleImages;
        [self.tableView reloadData];
    }
    else {
        self.navigationItem.rightBarButtonItem = nil;
        groupTitleNames = commGroupTitleNames;
        groupTitleImages = commGroupTileImages;
        [self.tableView reloadData];
    }

}

@end
