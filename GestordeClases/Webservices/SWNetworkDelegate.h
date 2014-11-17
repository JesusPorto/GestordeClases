//
//  SWNetworkDelegate.h
//  GestordeClases
//
//  Created by Formacion on 17/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SWNetworkDelegate <NSObject>

-(void)receiveData:(NSMutableArray *)anArray;
-(void)dataFailure:(NSString *)anErrorMessage;

@end
