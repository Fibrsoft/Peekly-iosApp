//
//  MyGroupsTableCell.m
//  Peekly
//
//  Created by Karan Khatter on 6/5/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "MyGroupsTableCell.h"

@implementation MyGroupsTableCell
@synthesize nameLabel = _nameLabel;
@synthesize pointsLabel = _pointsLabel;
@synthesize backgroundImageView = _backgroundImageView;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
