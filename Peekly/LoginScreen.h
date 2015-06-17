//
//  LoginScreen.h
//  Peekly
//
//  Created by Karan Khatter on 6/10/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginScreen : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signInAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
- (IBAction)backgroundTap:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (weak, nonatomic) IBOutlet UILabel *incorrectLogin;

@end
