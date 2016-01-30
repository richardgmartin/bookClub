//
//  Book+CoreDataProperties.h
//  BookClub
//
//  Created by Richard Martin on 2016-01-30.
//  Copyright © 2016 Richard Martin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSString *detail;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<Reader *> *readers;

@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addReadersObject:(Reader *)value;
- (void)removeReadersObject:(Reader *)value;
- (void)addReaders:(NSSet<Reader *> *)values;
- (void)removeReaders:(NSSet<Reader *> *)values;

@end

NS_ASSUME_NONNULL_END
