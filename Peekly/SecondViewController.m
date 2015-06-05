//
//  SecondViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/3/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams" size:28], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
