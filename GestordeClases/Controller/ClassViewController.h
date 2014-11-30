//
//  ClassViewController.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 30/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWNetworkDelegate.h"

@interface ClassViewController : UIViewController
<SWNetworkDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Titulo;
@property (weak, nonatomic) IBOutlet UILabel *StartTime;
@property (weak, nonatomic) IBOutlet UILabel *EndTIme;
@property (weak, nonatomic) IBOutlet UILabel *Description;
@property (assign) int idToLoad;

-(void)getClassInformation:(int) classID;

@end
