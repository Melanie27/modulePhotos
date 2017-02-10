//
//  LoginViewController.h
//  modulePhotos
//
//  Created by MELANIE MCGANNEY on 2/10/17.
//  Copyright © 2017 Melanie McGanney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@import FirebaseDatabase;
@interface LoginViewController : UIViewController

@property (strong, nonatomic) FIRDatabaseReference *ref;


- (IBAction)didCreateAccount:(id)sender;

- (IBAction)didTapEmailLogin:(id)sender;

- (IBAction)didTapSignOut:(id)sender;

- (IBAction)IBActiondidRequestPasswordReset:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (nonatomic, strong) IBOutlet UIButton *createAccount;

@property (nonatomic, strong) IBOutlet UIButton *submitAccount;

@property (nonatomic, strong) IBOutlet UIButton *logoutAccount;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic)IBOutlet UIViewController *questionsVC;
@property IBOutlet UIButton *questionsButton;

@end
