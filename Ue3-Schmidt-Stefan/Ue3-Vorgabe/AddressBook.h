//
//  AddressBook.h
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject <NSCoding>

@property (nonatomic, retain) NSMutableArray *cards;
- (void)addCard:(AddressCard *)card;
- (void)removeCard:(AddressCard *)card;
+ (AddressBook *)addressBookWithFile:(NSString *)path;
- (NSArray *)findCardForLastName:(NSString *)lastName;
- (BOOL)saveToFile:(NSString*)path;
@end
