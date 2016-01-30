//
//  FriendsTableViewController.m
//  BookClub
//
//  Created by Richard Martin on 2016-01-27.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "FriendDetailViewController.h"
#import "AppDelegate.h"


@interface FriendsTableViewController ()

@property NSArray *friendsArray;
@property NSManagedObjectContext *moc;
@property NSArray *readerArray;
@property (weak, nonatomic) IBOutlet UITableView *tableViewToo;




@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    [self loadFriends:@0];
    
}


-(void)loadFriends:(NSNumber *)friend {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Reader"];
    NSPredicate *friendPredicate = [NSPredicate predicateWithFormat:@"friend == %@", friend];
    request.predicate = friendPredicate;
    
    NSError *error;
    
    self.friendsArray = [self.moc executeFetchRequest:request error:&error];
    
    NSLog(@"self.friendsArray is, %@", self.friendsArray);
    
    if (error == nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"gnarly, dude. you have an error.");
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    [self loadFriends:@1];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.friendsArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendsCellID" forIndexPath:indexPath];
    Reader *reader = self.friendsArray[indexPath.row];
    cell.textLabel.text = reader.name;
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"FriendDetailSegue"]) {
        
        NSLog(@"prepareForSegue: %@", segue.identifier);
        
        FriendsTableViewController *dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableViewToo indexPathForCell:sender];
        self.readerObject = [self.readerArray objectAtIndex:indexPath.row];
        dvc.readerObject = self.readerObject;

    } else {
        // segue to add friend from reader list
    }
    
    
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


@end
