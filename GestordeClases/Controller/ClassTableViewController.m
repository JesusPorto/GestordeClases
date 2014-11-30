//
//  ClassTableViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "ClassTableViewController.h"
#import "Classes.h"
#import "ClassCell.h"
#import "SQLiteAccess+Classes.h"
#import "Classes.h"
#import "ClassesJSonClient.h"
#import "SWNetworkDelegate.h"
#import <AFNetworking/AFNetworking.h>
#import "ClassViewController.h"

@interface ClassTableViewController ()

@property (nonatomic,strong) NSArray *clases;

@end

@implementation ClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_clases = [SQLiteAccess GetClasses ];
    ClassesJSonClient *ws = ClassesJSonClient.new;
    [ws getAllClassesForController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_clases count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellClass" forIndexPath:indexPath];
    
    Classes *tmpClass = [_clases objectAtIndex:indexPath.row];
    
    [cell.NameClassLabel setText:tmpClass.name];
    [cell.StartCassLabel setText:tmpClass.start];
    [cell.FinishClassLabel setText:tmpClass.end];
    
    return cell;
}


-(void)receiveData:(NSMutableArray *)anArray{
    
}
-(void)dataFailure:(NSString *)anErrorMessage{
    
}

-(void)receiveAllClasses:(NSMutableArray *)aClasses{
    _clases = aClasses;
    [self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    Classes *tmpClass = [_clases objectAtIndex:indexPath.row];
    ClassViewController  *stController = [segue destinationViewController];
    [stController setIdToLoad:tmpClass.id_class];
}


@end
