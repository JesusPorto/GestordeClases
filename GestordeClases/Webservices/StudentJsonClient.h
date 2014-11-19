//
//  StudentJsonClient.h
//  GestordeClases
//
//  Created by Formacion on 19/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface StudentJsonClient : NSObject

-(void)getStudentForController:(id)aController andStudent:(int)anId;

@end
