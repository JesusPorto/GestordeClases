//
//  ClassViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 30/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "ClassViewController.h"
#import "Classes.h"
#import "ClassesJSonClient.h"
#import "SWNetworkDelegate.h"
#import <AFNetworking/AFNetworking.h>

@interface ClassViewController ()

@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ClassesJSonClient *ws = ClassesJSonClient.new;
    [ws getClassForController:self andClass:_idToLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getClassInformation:(int) classID{

}

-(void)receiveData:(NSMutableArray *)anArray{
    
}

-(void)dataFailure:(NSString *)anErrorMessage{
    
}

-(void)receiveClasses:(Classes *)aClasses{
    [_Titulo setText: aClasses.name];
    [_StartTime setText:aClasses.start];
    [_EndTIme setText:aClasses.end];
    [_Description setText:aClasses.descr];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
