//
//  SQLiteAccess+Student.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "SQLiteAccess+Student.h"
#import "Student.h"

@implementation SQLiteAccess (Student)

+(Student *)selectByEmail:(NSString *)aEmail{
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM alumnos WHERE email = '%@'",aEmail];
   NSArray *tab= [SQLiteAccess selectManyRowsWithSQL:query];
    for(NSDictionary *dict in tab) {
        Student *student = [Student.alloc initWithDictionary:dict];
        return student;
    }
    return nil;
}

+(NSArray *)SelectAll{
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM alumnos "];
    NSArray *tab= [SQLiteAccess selectManyRowsWithSQL:query];
    NSMutableArray *Students = [NSMutableArray.alloc init];
    for(NSDictionary *dict in tab) {
        Student *student = [Student.alloc initWithDictionary:dict];
        [Students addObject:student];
    }
    return Students;
}
@end
