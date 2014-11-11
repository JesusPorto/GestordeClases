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

@interface ClassTableViewController ()

@property (nonatomic,strong) NSMutableArray *clases;

@end

@implementation ClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *results = [SQLiteAccess selectManyRowsWithSQL:@"SELECT * FROM CLASES"];
    _clases = [NSMutableArray.alloc init];
    for (NSDictionary *dic in results) {
        Classes *newClass = [Classes.alloc init];
        newClass.name = [dic objectForKey:@"nombre"];
        newClass.descr = [dic objectForKey:@"descripcion"];
        newClass.start = [dic objectForKey:@"inicio"];
        newClass.end = [dic objectForKey:@"fin"];
        newClass.teacher = [dic objectForKey:@"profesor"];
        [_clases addObject:newClass];
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
