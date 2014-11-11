//
//  ClassCell.h
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *NameClassLabel;
@property (weak, nonatomic) IBOutlet UILabel *StartCassLabel;
@property (weak, nonatomic) IBOutlet UILabel *FinishClassLabel;
@end
