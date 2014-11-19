//
//  SQLiteAccess+Student.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "SQLiteAccess.h"
#import "Student.h"

@interface SQLiteAccess (Student)
+(NSArray *)SelectAll;
+(int)selectByEmail:(NSString *)aEmail;
@end
