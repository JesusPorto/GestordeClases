//
//  StudentViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "StudentViewController.h"
#import "Student.h"
#import "StudentJsonClient.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "SWNetworkDelegate.h"

@interface StudentViewController ()

@property Student* std;



@end
@implementation StudentViewController

-(void)setStudentId:(int)stud{
    _std.Student_id = stud;
  }

- (void)viewDidLoad {
    [super viewDidLoad];
    /*[self.NameLabel setText:_std.name];
    [self.LastNameLabel setText:_std.LastName];
    [self.CityLabel setText:_std.city];
    [self.emailLabel setText:_std.email];
    NSURL *url = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg"];
    NSURL *urlPlaceho = [NSURL URLWithString:@"http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_red_512.gif"];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:urlPlaceho]];
    [self.AvatarImageView setImageWithURL:url placeholderImage:img];*/
    
    StudentJsonClient *ws = StudentJsonClient.new;
    [ws getStudentForController:self andStudent:_studentID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated{
    /*
    [super viewDidAppear:animated];
    NSURL *url = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg"];
    
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    [self.AvatarImageView setImage: img];
    */
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

-(void)receiveData:(NSMutableArray *)anArray{
    
}

-(void)dataFailure:(NSString *)anErrorMessage{
    
}

-(void)receiveStudent:(Student *)aStudent{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    _std = aStudent;
    [self setupUI];}

-(void)setupUI{
    [_NameLabel setText:_std.name];
    [_CityLabel setText:_std.city];
    [_LastNameLabel setText:_std.LastName];
    [_emailLabel setText:_std.email];
}

@end
