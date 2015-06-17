//
//  AddGroupController.h
//  Peekly
//
//  Created by Karan Khatter on 6/16/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGroupController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewSwitch;
@property (weak, nonatomic) IBOutlet UIView *viewAddGroup;
@property (weak, nonatomic) IBOutlet UITextField *groupName;
@property (weak, nonatomic) IBOutlet UILabel *labelAddGroup;
-(void) groupNameTab;
-(void) descriptionTab;
- (IBAction)groupNextButton:(id)sender;
- (IBAction)tapGesture:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *groupiesList;
@property (weak, nonatomic) IBOutlet UIButton *groupNextButtonOutlet;
- (IBAction)groupNameSet:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *groupDescription;



@end
