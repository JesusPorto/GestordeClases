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
#import "StudentXmlClient.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface TableViewController ()

@property (nonatomic,strong) NSArray *students;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _students = [NSMutableArray.alloc init];
    _students = [SQLiteAccess SelectAll];
    /*
    for(int x=0;x<100;x++){
        Student *student = [Student.alloc init];
        student.name = @"Jesús";
        student.city = @"Coruña";
        [_students addObject:student];
    }
     */
    _students = NSMutableArray.new;
    StudentXmlClient *ws = [StudentXmlClient new];
    
    [ws getStudentsWithController:self];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HUD setLabelText:@"Loading"];
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
    
    //Check identifier
    if ([[segue identifier] isEqual:@"ViewAlumn"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Student *tmpStud = [_students objectAtIndex:indexPath.row];
        StudentViewController  *stController = [segue destinationViewController];
        
        [stController setStudentID:tmpStud.Student_id];
    }

}



-(void)receiveData:(NSMutableArray *)anArray{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
    _students = [NSMutableArray arrayWithArray:anArray];
    [self.tableView reloadData];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
-(void)dataFailure:(NSString *)anErrorMessage{
#ifndef NDEBUG
    NSLog(@"%s (line:%d)",__PRETTY_FUNCTION__,__LINE__);
#endif
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:anErrorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert show];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

@end
