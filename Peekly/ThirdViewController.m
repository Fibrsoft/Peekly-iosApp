//
//  ThirdViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/5/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "ThirdViewController.h"
#import "HMSegmentedControl.h"

@interface ThirdViewController (){
    
    float widthScreen;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    //Width of screen
    CGRect Rect= self.view.bounds;
    widthScreen = Rect.size.width;
    
    //Segment Control
    //Segmented Controller
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Notification", @"My Peeks"]];
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:(73/255.0) green:(158/255.0) blue:(255/255.0) alpha:1];
    
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
    [self.segmentControl addSubview:segmentedControl];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
