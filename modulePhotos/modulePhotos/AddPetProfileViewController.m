//
//  AddPetProfileViewController.m
//  modulePhotos
//
//  Created by MELANIE MCGANNEY on 2/10/17.
//  Copyright © 2017 Melanie McGanney. All rights reserved.
//

#import "AddPetProfileViewController.h"

#import "PCDataSource.h"
#import <Photos/Photos.h>
#import "Pet.h"

@interface AddPetProfileViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSString *downloadURLString;

@end

@implementation AddPetProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Pet";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    // Do any additional setup after loading the view.
    
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];
    
    newFrame.origin.y -= (keyboardFrameBegin.origin.y - keyboardFrameEnd.origin.y);
    self.view.frame = newFrame;
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIImagePicker Delegate Methods

- (IBAction)uploadProfilePhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    
}

-(void)sendPetInfoToFirebase {
    NSMutableDictionary *addPetParameters = [@{} mutableCopy];
    PCDataSource *pc = [PCDataSource sharedInstance];
    
    if ( self.petNameTextField.text.length == 0) {
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle: @"Please add a pet name"
                                    message: @""
                                    preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler: nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        
        Pet *pet = [[Pet alloc] init];
        
        
        [addPetParameters setObject:self.petNameTextField.text forKey:@"petName"];
        [addPetParameters setObject:self.animalTypeTextField.text forKey:@"petType"];
        
        [addPetParameters setObject:self.dobTextField.text forKey:@"dob"];
        [addPetParameters setObject:self.dodTextField.text forKey:@"dod"];
        
        [addPetParameters setObject:self.animalPersonalityTextView.text forKey:@"personality"];
        [addPetParameters setObject:self.ownerNameTextField.text forKey:@"ownerName"];
        
        NSString *petImageString = self.downloadURLString;
        if ([self.downloadURLString length] == 0) {
            //NSLog(@"no image was uploaded" );
            petImageString = @"https://firebasestorage.googleapis.com/v0/b/petcemetary-5fec2.appspot.com/o/petFeed%2FprofilePlaceholder.png?alt=media&token=c5d106a3-d5d0-4d69-8732-a29bf1f3542c";
            [addPetParameters setObject:petImageString forKey:@"placeholderImage"];
        }
        
        [addPetParameters setObject:petImageString forKey:@"placeholderImage"];
        [pc addNewPetWithDataDictionary:addPetParameters andPet:pet];
        UIAlertController *alertSaved = [UIAlertController
                                         alertControllerWithTitle: @"Thank you for starting your pet's memorial"
                                         message: @"Please add photos of your pet to its album."
                                         preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler: nil];
        [alertSaved addAction:cancel];
        [self presentViewController:alertSaved animated:YES completion:^(){
            
            
        }];
        
    }
    
}

- (IBAction)savePetProfile:(id)sender {
    
    [self sendPetInfoToFirebase];
  
}



@end
