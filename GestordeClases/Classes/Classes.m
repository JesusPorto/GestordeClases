//
//  Classes.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "Classes.h"

@implementation Classes

-(id)initWithDictionaryForJSon:(NSDictionary*)dic{
    self = [super init];
    if (self){
        NSDateFormatter *jSondateFormatter=[[NSDateFormatter alloc] init];
        [jSondateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
        NSDate *endD = NSDate.new;
        endD =  [jSondateFormatter dateFromString:[dic objectForKey:@"ends_at"]];
        
        NSDate *startD = NSDate.new;

        startD =[jSondateFormatter dateFromString:[dic objectForKey:@"starts_at"]];
        self.name = [dic objectForKey:@"name"];
        self.descr = [dic objectForKey:@"description"];
        self.end = [dateFormatter stringFromDate:endD];
        self.start = [dateFormatter stringFromDate:startD];
        self.id_class = [[dic objectForKey:@"id"]intValue];
    }
    return self;
}

@end
