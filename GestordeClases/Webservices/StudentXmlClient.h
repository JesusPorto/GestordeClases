//
//  StudentXmlClient.h
//  GestordeClases
//
//  Created by Formacion on 17/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "BaseXmlParser.h"

@interface StudentXmlClient : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

-(void)getStudentsWithController:(id)aController;


@end
