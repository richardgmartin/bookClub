//
//  FriendDetailViewController.m
//  BookClub
//
//  Created by Richard Martin on 2016-01-30.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "AppDelegate.h"

@interface FriendDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property NSArray *bookArray;
@property NSManagedObjectContext *moc;
@property (weak, nonatomic) IBOutlet UITableView *readerBookListTableView;
@property NSString *byAuthor;

@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Book List";
    
//    self.title = self.readerObject.name;
    
    self.moc = self.readerObject.managedObjectContext;
    [self loadReaderBooks];
    
}

- (void)loadReaderBooks {
    
    self.bookArray = self.readerObject.books.allObjects;
    [self.readerBookListTableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated {
    self.bookArray = self.readerObject.books.allObjects;
    [self.readerBookListTableView reloadData];
    
}
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"BookCellID"];
    
    Book *book = [self.bookArray objectAtIndex:indexPath.row];
    cell.textLabel.text = book.title;
    self.byAuthor = [NSString stringWithFormat:@"by %@", book.author];
    cell.detailTextLabel.text = self.byAuthor;
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
