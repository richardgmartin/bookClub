//
//  ReadersTableViewController.m
//  BookClub
//
//  Created by Richard Martin on 2016-01-27.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ReadersTableViewController.h"
#import "AppDelegate.h"
#import "Reader.h"

@interface ReadersTableViewController ()

@property NSArray *readerList;
@property NSManagedObjectContext *moc;
@property Reader *reader;

@end

@implementation ReadersTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    [self loadReaders];
    
    if (self.readerList.count == 0) {
        
        NSString *readerString = [[NSBundle mainBundle]pathForResource:@"friends" ofType:@"json"];
        self.readerList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:readerString]
                                                          options:kNilOptions
                                                            error:nil];
        for (NSString *str in self.readerList) {
            self.reader = [NSEntityDescription insertNewObjectForEntityForName:@"Reader" inManagedObjectContext:self.moc];
            self.reader.name = str;
            self.reader.friend = @0;
            [self.moc save:nil];
//            [self.tableView reloadData];
        }
        [self loadReaders];
    }
}

- (void)loadReaders {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Reader"];
    self.readerList = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self loadReaders];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readerList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReadersCellID" forIndexPath:indexPath];
    self.reader = [self.readerList objectAtIndex:indexPath.row];
    cell.textLabel.text = self.reader.name;
    if ([self.reader.friend isEqual:[NSNumber numberWithBool:true]]) {
        cell.backgroundColor = [UIColor greenColor];        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.reader = [self.readerList objectAtIndex:indexPath.row];
    self.reader.name = cell.textLabel.text;
    
    if ([self.reader.friend isEqual:[NSNumber numberWithBool:false]]) {
        cell.backgroundColor = [UIColor greenColor];
        self.reader.friend = @1;
        [self.moc save:nil];
        
    } else {
        cell.backgroundColor = [UIColor whiteColor];
        self.reader.friend = @0;
        [self.moc save:nil];
    }
}
@end
