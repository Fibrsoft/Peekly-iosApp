//
//  SecondViewController.m
//  Peekly
//
//  Created by Karan Khatter on 6/3/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "SecondViewController.h"
#import "MyGroupsTableCell.h"

@interface SecondViewController () {
    NSMutableArray *groupNames;
    float widthScreen;
    NSMutableArray *titlearray;
    
}



@end

@implementation SecondViewController
@synthesize trendTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    trendTableView.delegate = self;
    trendTableView.dataSource = self;
    
    titlearray = [[NSMutableArray alloc]initWithObjects:@"One", @"two", @"three", nil];
    
    //Get width of screen
    CGRect Rect= self.view.bounds;
    widthScreen = Rect.size.width;
    
    //Table View Current Groups
    groupNames = [[NSMutableArray alloc]initWithObjects:@"Trend 1", @"Trend 2", @"Trend 3", nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
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
    static NSString *simpleTableIdentifier = @"MyGroupsTableCell";
    
    MyGroupsTableCell *cell = (MyGroupsTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyGroupsTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.nameLabel.adjustsFontSizeToFitWidth = YES;//Makes sure the font size readjusts size
    cell.nameLabel.text = @"Texas A&M University"; //Name of group label
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"testImage.jpg"]]; //Group label image
    imageView.frame = CGRectMake(0, 0, widthScreen, 80);
    imageView.alpha = 1.0; //opacity of the cell
    cell.backgroundView = imageView; //setting the cell to be this image
    cell.pointsLabel.text = @"+1000"; //Group points label (Must add the + in front"
    cell.pointsLabel.adjustsFontSizeToFitWidth = YES; //Makes sure the font size readjusts the size
    
    return cell;
    
    
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Hard coded to check the titleArray array to get the row selected
    NSString *value = [titlearray objectAtIndex:indexPath.row];
    NSString *selected = @"You've selected row ";
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:[selected stringByAppendingString:value] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
    [messageAlert show];
}

- (UIImage *)imageWithImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
