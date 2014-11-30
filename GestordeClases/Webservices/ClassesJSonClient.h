//
//  ClassesJSonClient.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 30/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassesJSonClient : NSObject

-(void)getClassForController:(id)aController andClass:(int)anId;
-(void)getAllClassesForController:(id)aController;

@end
