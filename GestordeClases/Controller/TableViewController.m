//
//  TableViewController.m
//  GestordeClases
//
//  Created by Jesús Porto Sánchez on 11/11/14.
//  Copyright (c) 2014 ___JesúsPorto___. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"
#import "TableViewCell.h"
#import "SQLiteAccess+Student.h"
#import "StudentViewController.h"

@interface TableViewController ()

@property (nonatomic,strong) NSMutableArray *students;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _students = [NSMutableArray.alloc init];
    /*
    for(int x=0;x<100;x++){
        Student *student = [Student.alloc init];
        student.name = @"Jesús";
        student.city = @"Coruña";
        [_students addObject:student];
    }
     */
    NSArray *tab = [SQLiteAccess selectManyRowsWithSQL:@"SELECT * FROM ALUMNOS"];
    for(NSDictionary *dict in tab) {
        Student *student = [Student.alloc init];
        student.name = [dict objectForKey:@"nombre"];
        student.city = [dict objectForKey:@"ciudad"];
        student.LastName = [dict objectForKey:@"apellidos"];
        student.email = [dict objectForKey:@"email"];
        student.avatar = [dict objectForKey:@"avatar_url"];
        [_students addObject:student];
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
    if (section == 0) {
        return [_students count];
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) %i", __PRETTY_FUNCTION__, __LINE__, (int)indexPath.row);
#endif
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"  forIndexPath:indexPath];
    
    Student *tmpStud = [_students objectAtIndex:indexPath.row];
    [cell.NameLabel setText:tmpStud.name];
    [cell.CityLabel setText:tmpStud.city];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *nextScreen = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:nextScreen];
    StudentViewController  *stController = [segue destinationViewController];
    
    Student *tmpStud = [_students objectAtIndex:indexPath.row];
    
    
    [stController setStudent:tmpStud];
}


@end
