//
//  ClassesJSonClient.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 30/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "Classes.h"
#import "ClassesJSonClient.h"
#import "SWNetworkDelegate.h"
#import <AFNetworking/AFNetworking.h>


@interface ClassesJSonClient ()

@property (assign) int class_ID;
@property (nonatomic,strong) id<SWNetworkDelegate> controller;

@end


@implementation ClassesJSonClient


-(void)getClassForController:(id<SWNetworkDelegate>)aController andClass:(int)anId{
    
    _controller = aController;
    
    NSString *urlString = [NSString stringWithFormat:@"http://curso.softwhisper.es/aecomo_classes/%i.json",anId];
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        Classes *classes = [[Classes alloc] initWithDictionaryForJSon:responseObject];
        [_controller receiveClasses:classes];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        [_controller dataFailure:[error localizedDescription]];
    }];
    //[[NSOperationQueue mainQueue] addOperation:op];
    NSOperationQueue *ourQueue= [[NSOperationQueue alloc]init];
    [ourQueue setName:@"ClassesQueue"];
    [ourQueue setMaxConcurrentOperationCount:2];
    [ourQueue addOperation:op];
}

-(void)getAllClassesForController:(id)aController{
    _controller = aController;
    
    NSString *urlString = [NSString stringWithFormat:@"http://curso.softwhisper.es/aecomo_classes.json"];
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        NSMutableArray *listClasses = [NSMutableArray.alloc init];
        for (NSDictionary *tmpClass in responseObject) {
            Classes *classes = [[Classes alloc] initWithDictionaryForJSon:tmpClass];
            [listClasses addObject:classes];
        }

        [_controller receiveAllClasses:listClasses];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        [_controller dataFailure:[error localizedDescription]];
    }];
    //[[NSOperationQueue mainQueue] addOperation:op];
    NSOperationQueue *ourQueue= [[NSOperationQueue alloc]init];
    [ourQueue setName:@"ClassesQueue"];
    [ourQueue setMaxConcurrentOperationCount:2];
    [ourQueue addOperation:op];
}

@end
