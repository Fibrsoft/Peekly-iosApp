//
//  LoginScreen.m
//  Peekly
//
//  Created by Karan Khatter on 6/10/15.
//  Copyright (c) 2015 Fibrsoft. All rights reserved.
//

#import "LoginScreen.h"


@interface LoginScreen()

@end

@implementation LoginScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"CaviarDreams-Bold" size:18], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    _incorrectLogin.hidden = YES;
    
    //Set background image of LoginScreen
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"loginViewPeak2.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //Button Properties
    _signInButton.backgroundColor = [UIColor colorWithRed:(10/255.0) green:(186/255.0) blue:(181/255.0) alpha:1];
    _signInButton.layer.cornerRadius = 20;
    
    //Make sure the text isn't too small
    _signUpLabel.adjustsFontSizeToFitWidth = YES;
    
    
    //Text Field attributes
    _usernameField.borderStyle = UITextBorderStyleNone;
    _usernameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"DevanagariSangamMN" size:20.0]}];
    CALayer *bottomUserBorder = [CALayer layer];
    bottomUserBorder.frame = CGRectMake(0.0f, _usernameField.frame.size.height - 1, _usernameField.frame.size.width, 1.0f);
    bottomUserBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [_usernameField.layer addSublayer:bottomUserBorder];
    
    _passwordField.borderStyle = UITextBorderStyleNone;
    _passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"DevanagariSangamMN" size:20.0]}];
    CALayer *bottomPassBorder = [CALayer layer];
    bottomPassBorder.frame = CGRectMake(0.0f, _passwordField.frame.size.height - 1, _passwordField.frame.size.width, 1.0f);
    bottomPassBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [_passwordField.layer addSublayer:bottomPassBorder];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signInAction:(id)sender {
    //Get rid of keyboard if not gone
    [self.view endEditing:YES];
    [self performSegueWithIdentifier:(@"loginSuccess") sender:self];
    NSString *username = _usernameField.text;
    NSString *password = _passwordField.text;
    /*if ([username isEqualToString: @"Karan"] && [password isEqual: @"password"] ) {
        [self performSegueWithIdentifier:(@"loginSuccess") sender:self];
        NSLog(@"success");
    }
    else {
        _incorrectLogin.hidden = NO;
        NSLog(@"Fail");
    }*/
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}
@end