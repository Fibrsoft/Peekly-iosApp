//
//  MyGroupsTableCell.h
//  Peekly
//
//  Created by Karan Khatter on 6/5/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyGroupsTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *pointsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@end
