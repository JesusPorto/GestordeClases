//
//  AddStudentViewController.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 23/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStudentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UILabelName;
@property (weak, nonatomic) IBOutlet UITextField *UILabelLastName;
@property (weak, nonatomic) IBOutlet UITextField *UILabelCity;
@property (weak, nonatomic) IBOutlet UITextField *UILabelMail;
@property (weak, nonatomic) IBOutlet UIButton *UIButtonClean;
@property (weak, nonatomic) IBOutlet UIButton *UIButtonSaveStudent;
@property (weak, nonatomic) IBOutlet UITextField *UILabelAvatar;
-(IBAction)doUIButtonClean:(id)sender;
-(IBAction)doUIButtonSaveStudent:(id)sender;
@end
