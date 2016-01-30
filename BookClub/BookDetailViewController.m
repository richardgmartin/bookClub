//
//  BookDetailViewController.m
//  BookClub
//
//  Created by Richard Martin on 2016-01-30.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "BookDetailViewController.h"
#import "AppDelegate.h"

@interface BookDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *bookTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *bookDetailTextField;
@property (weak, nonatomic) IBOutlet UITextField *bookAuthorTextField;

@property NSManagedObjectContext *moc;



@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    
    self.title = @"Book Detail";
    

}

- (IBAction)onDoneButtonPressed:(UIButton *)sender {
    
    
    Book *bookObject = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.moc];
    
    bookObject.title = self.bookTitleTextField.text;
    bookObject.detail = self.bookDetailTextField.text;
    bookObject.author = self.bookAuthorTextField.text;
    
//    bookObject.readers = self.readerObject;
    
    [self.readerObject addBooksObject:bookObject];
    [self.readerObject.managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
