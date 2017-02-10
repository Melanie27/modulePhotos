//
//  Pet.h
//  petCemetary
//
//  Created by MELANIE MCGANNEY on 11/11/16.
//  Copyright © 2016 melaniemcganney.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Pet : NSObject






@property (nonatomic, assign) NSString *petID;
@property (nonatomic, assign) NSString *photoID;


@property (nonatomic, assign) NSString *petDOB;
@property (nonatomic, assign) NSString *petDOD;
@property (nonatomic, strong) NSString *petName;
@property (nonatomic, strong) NSString *petType;
@property (nonatomic, strong) NSString *petPersonality;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *ownerUID;

@property (nonatomic, strong) NSURL *feedImageURL;
@property (nonatomic, strong) NSString *feedImageString;
@property (nonatomic, strong) UIImage *feedImage;
@property (nonatomic, strong) NSString *feedCaption;




@property (nonatomic, strong) NSString *photoIDString;




- (NSString *) newPet;

@end
