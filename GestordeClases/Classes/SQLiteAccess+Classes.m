//
//  SQLiteAccess+Classes.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "SQLiteAccess+Classes.h"
#import "Classes.h"

@implementation SQLiteAccess (Classes)
+(NSArray*)GetClasses{
    NSArray *results = [SQLiteAccess selectManyRowsWithSQL:@"SELECT * FROM CLASES"];
    NSMutableArray* clases = [NSMutableArray.alloc init];
    for (NSDictionary *dic in results) {
        Classes *newClass = [Classes.alloc init];
        newClass.name = [dic objectForKey:@"nombre"];
        newClass.descr = [dic objectForKey:@"descripcion"];
        newClass.start = [dic objectForKey:@"inicio"];
        newClass.end = [dic objectForKey:@"fin"];
        newClass.teacher = [dic objectForKey:@"profesor"];
        [clases addObject:newClass];
    }
    return clases;
}
@end
