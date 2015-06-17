//
//  FourthViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/5/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end