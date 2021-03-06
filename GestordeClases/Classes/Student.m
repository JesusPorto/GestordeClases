//
//  Student.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "Student.h"


@implementation Student
-(id)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if (self){
        self.name = [dic objectForKey:@"nombre"];
        self.city = [dic objectForKey:@"ciudad"];
        self.LastName = [dic objectForKey:@"apellidos"];
        self.email = [dic objectForKey:@"email"];
        self.avatar = [dic objectForKey:@"avatar_url"];
        //self.Student_id = [dic objectForKey:@"id"];
    }
    return self;
}
-(id)initWithDictionaryForJSon:(NSDictionary*)dic{
    self = [super init];
    if (self){
        self.name = [dic objectForKey:@"name"];
        self.city = [dic objectForKey:@"city"];
        self.LastName = [dic objectForKey:@"apellidos"];
        self.email = [dic objectForKey:@"email"];
        self.avatar = [dic objectForKey:@"avatar_url"];
        //self.Student_id = [dic objectForKey:@"id"];
    }
    return self;
}

@end

