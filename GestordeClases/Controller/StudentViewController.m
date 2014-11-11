//
//  StudentViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "StudentViewController.h"
#import "Student.h"

@interface StudentViewController ()

@property Student* std;

@end

@implementation StudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.NameLabel setText:_std.name];
    [self.LastNameLabel setText:_std.LastName];
    [self.CityLabel setText:_std.city];
    [self.emailLabel setText:_std.email];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStudent:(Student*)stud{
    
    _std = stud;

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
