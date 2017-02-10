//
//  AddPetProfileViewController.h
//  modulePhotos
//
//  Created by MELANIE MCGANNEY on 2/10/17.
//  Copyright © 2017 Melanie McGanney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class Pet;

@interface AddPetProfileViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *petNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *animalTypeTextField;


@property (strong, nonatomic) IBOutlet UITextView *animalPersonalityTextView;
@property (strong, nonatomic) IBOutlet UITextField *ownerNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *uploadProfilePhotoButton;
@property (strong, nonatomic) IBOutlet UITextField *dobTextField;
@property (strong, nonatomic) IBOutlet UITextField *dodTextField;



@property (strong, nonatomic) NSURL *petImageURL;


- (IBAction)savePetProfile:(id)sender;
- (IBAction)uploadProfilePhoto:(id)sender;

@end
