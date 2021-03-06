//
//  StudentJsonClient.m
//  GestordeClases
//
//  Created by Formacion on 19/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "Student.h"
#import "StudentJsonClient.h"
#import "SWNetworkDelegate.h"
#import <AFNetworking/AFNetworking.h>

@interface StudentJsonClient ()

@property (assign) int student_id;
@property (nonatomic,strong) id<SWNetworkDelegate> controller;

@end


@implementation StudentJsonClient
-(void)getStudentForController:(id<SWNetworkDelegate>)aController andStudent:(int)anId{
    
    _controller = aController;
    
    NSString *urlString = [NSString stringWithFormat:@"http://curso.softwhisper.es/stundents/%i.json",anId];
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        Student *student = [[Student alloc] initWithDictionaryForJSon:responseObject];
        [_controller receiveStudent:student];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        #ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        [_controller dataFailure:[error localizedDescription]];
    }];
    //[[NSOperationQueue mainQueue] addOperation:op];
    NSOperationQueue *ourQueue= [[NSOperationQueue alloc]init];
    [ourQueue setName:@"StudentsQueue"];
    [ourQueue setMaxConcurrentOperationCount:2];
    [ourQueue addOperation:op];
    
}
@end
