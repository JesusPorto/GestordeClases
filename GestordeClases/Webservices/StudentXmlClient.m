//
//  StudentXmlClient.m
//  GestordeClases
//
//  Created by Formacion on 17/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "StudentXmlClient.h"
#import "Student.h"
#import "SWNetworkDelegate.h"

@interface StudentXmlClient ()

@property (nonatomic,strong) id<SWNetworkDelegate> controller;
@property (nonatomic,strong) NSMutableData *wip;
@property (nonatomic,strong) NSMutableArray *students;
@property (nonatomic,strong) Student *t;

@end

@implementation StudentXmlClient

-(void)getStudentsWithController:(id)aController{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    
    _controller = aController;
    
    NSString *urlString = @"http://curso.softwhisper.es/stundents.xml";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest.alloc initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:300];
    
    NSURLConnection *conection = [NSURLConnection.alloc initWithRequest:urlRequest delegate:self];
    
    [conection start];
    
}

#pragma mark - NSURLConnectionDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    [_controller dataFailure:error.localizedFailureReason];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (([httpResponse statusCode]>=200) && ([httpResponse statusCode]<300)){
            _wip = NSMutableData.new;
    }else{
        [_controller dataFailure:@"Error en la conexión"];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    //Agregamos los chunks al _wip
    [_wip appendData:data];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
  
    [self parseDocument:_wip];
    
    [_controller receiveData:_students];
    
}

#pragma mark - NSXMLParse

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    [self clearContentsOfElement];
    
    if([elementName isEqualToString:@"stundents"]){
        _students = NSMutableArray.new;
    }
    if([elementName isEqualToString:@"stundent"]){
        if (_t != nil) _t=nil;
        _t = Student.new;
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"name"]) {
        _t.name = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"lastname"]) {
        _t.LastName = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"city"]) {
        _t.city = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"email"]) {
        _t.email = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"image-url"]) {
         _t.avatar = _contentsOfElement;
    }
    
    if([elementName isEqualToString:@"stundent"]){
        [_students addObject:_t];
    }
    
    
    [self clearContentsOfElement];
}


@end
