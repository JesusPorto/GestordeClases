//
//  Student.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

-(id)initWithDictionary:(NSDictionary*)dic;
-(id)initWithDictionaryForJSon:(NSDictionary*)dic;

@property (assign) int Student_id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *LastName;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *avatar;


@end
