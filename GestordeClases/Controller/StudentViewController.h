//
//  StudentViewController.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface StudentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *AvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *LastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *CityLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
-(void)setStudent:(Student*)stud;
@end
