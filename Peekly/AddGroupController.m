//
//  AddGroupController.m
//  Peekly
//
//  Created by Karan Khatter on 6/16/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "AddGroupController.h"
#import "HMSegmentedControl.h"

@interface AddGroupController ()

    @property (nonatomic, strong) NSMutableArray *groupiesArray;

@end

@implementation AddGroupController

    float widthScreen;
    NSString *groupName;
    NSString *groupDescription;
    HMSegmentedControl *segmentedControl;
    int currentTab;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    currentTab = 0;
    
    //Groupies Table View
    self.groupiesList.delegate = self;
    self.groupiesList.dataSource = self;
    self.groupiesList.allowsMultipleSelection = YES;
    
    [self groupNameTab];
    
    //populate groupies data array **********NEED TO POPULATE FROM BACKEND******
    self.groupiesArray = [NSMutableArray new];
    NSString *itemFormatString = NSLocalizedString(@"Friend %d", @"Format string for item");
    for (unsigned int itemNumber = 1; itemNumber <= 12; itemNumber++)
    {
        NSString *itemName = [NSString stringWithFormat:itemFormatString, itemNumber];
        [self.groupiesArray addObject:itemName];
    }
    
    
    //Cosmetic Program adjustments
    _labelAddGroup.adjustsFontSizeToFitWidth = YES;
    self.groupDescription.layer.borderWidth = 1.0f;
    self.groupDescription.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    //Figure out screen size
    CGRect Rect= self.view.bounds;
    widthScreen = Rect.size.width;
    
    //Add HMSegmentedController
    //Segmented Controller
    segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Name", @"Info", @"Groupies"]];
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
    [self.viewSwitch addSubview:segmentedControl];
    
   
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure a cell to show the corresponding string from the array.
    static NSString *kCellID = @"groupiesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = [self.groupiesArray objectAtIndex:indexPath.row];
    
    return cell;
}



-(void)groupNameTab {
    _labelAddGroup.text = @"Create a name for your new private group";
    _groupName.hidden = NO;
    _groupDescription.hidden = YES;
    _groupiesList.hidden = YES;
    [_groupNextButtonOutlet setTitle:@"Next" forState:UIControlStateNormal];
}

-(void)descriptionTab {
    _labelAddGroup.text = @"Create a description for your new private group ";
    _groupName.hidden = YES;
    _groupDescription.hidden = NO;
    _groupiesList.hidden = YES;
    [_groupNextButtonOutlet setTitle:@"Next" forState:UIControlStateNormal];
    
}

-(void)groupiesTab {
    _labelAddGroup.text = @"Invite your groupies to join your private group";
    _groupName.hidden = YES;
    _groupDescription.hidden = YES;
    _groupiesList.hidden = NO;
    _groupNextButtonOutlet.titleLabel.adjustsFontSizeToFitWidth = YES;
    [_groupNextButtonOutlet setTitle:@"Create Group!" forState:UIControlStateNormal];
    
}

- (IBAction)groupNameSet:(id)sender {
    groupName = _groupName.text;
}


- (IBAction)groupNextButton:(id)sender {
    [self.view endEditing:YES];
    if(currentTab < 2){
        currentTab++;
        segmentedControl.selectedSegmentIndex = currentTab;
        [self segmentedControlChangedValue:segmentedControl];
        
    }
    else if( currentTab == 2){
        if([groupName length] != 0 && [_groupDescription.text length] != 0 )
        {
            groupDescription = _groupDescription.text;
            //**************************** Create Group! *************************************************
        }
        else
        {
            NSString *missingInformation = @"You did not complete the ";
            if([groupName length] == 0 )
                missingInformation = [missingInformation stringByAppendingString:@"group name"];
            if([groupName length] == 0 && [_groupDescription.text length] == 0) {
                missingInformation = [missingInformation stringByAppendingString:@" & "];
            }
            if([_groupDescription.text length] == 0 )
                 missingInformation = [missingInformation stringByAppendingString:@"group description"];
            missingInformation = [missingInformation stringByAppendingString:@". Please complete those before creating your group!"];
            UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Cannot Create Group" message:missingInformation delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            
            [messageAlert show];
        }
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)tapGesture:(id)sender {
        [self.view endEditing:YES];
}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    [self.view endEditing:YES];
    if (segmentedControl.selectedSegmentIndex == 0) {
        currentTab = 0;
        [self groupNameTab];
    }
    else if(segmentedControl.selectedSegmentIndex == 1) {
        currentTab = 1;
        [self descriptionTab];
    }
    else {
        currentTab = 2;
        [self groupiesTab];
        
    }
    
}


@end