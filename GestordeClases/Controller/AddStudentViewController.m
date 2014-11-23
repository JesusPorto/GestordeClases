//
//  AddStudentViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 23/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "AddStudentViewController.h"
#import "Student.h"

@interface AddStudentViewController ()

@end

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(IBAction)doUIButtonClean:(id)sender{
    [_UILabelName setText:@""];
    [_UILabelLastName setText:@""];
    [_UILabelCity setText:@""];
    [_UILabelMail setText:@""];
    [_UILabelAvatar setText:@""];
}

-(IBAction)doUIButtonSaveStudent:(id)sender{
    Student *student = [Student.alloc init];
    student.name = [_UILabelName text];
    student.LastName = [_UILabelLastName text];
    student.city = [_UILabelCity text];
    student.email = [_UILabelMail text];
    student.avatar = [_UILabelAvatar text];
    
}

@end
