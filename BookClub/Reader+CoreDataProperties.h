//
//  Reader+CoreDataProperties.h
//  BookClub
//
//  Created by Richard Martin on 2016-01-30.
//  Copyright © 2016 Richard Martin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Reader.h"

NS_ASSUME_NONNULL_BEGIN

@interface Reader (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *friend;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Book *> *books;

@end

@interface Reader (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet<Book *> *)values;
- (void)removeBooks:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
