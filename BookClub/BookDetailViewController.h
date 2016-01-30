//
//  BookDetailViewController.h
//  BookClub
//
//  Created by Richard Martin on 2016-01-30.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "Reader.h"

@interface BookDetailViewController : UIViewController

@property Book *bookObject;
@property Reader *readerObject;

@end
