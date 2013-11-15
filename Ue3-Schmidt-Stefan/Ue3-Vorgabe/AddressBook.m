//
//  AddressBook.m
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize cards = _cards;

- (void)addCard:(AddressCard *)card
{
    //[self.cards addObject:card];
    //[self sortCards];
    [self addCardSorted:card];
}

- (void)removeCard:(AddressCard *)card
{
    [self removeCardFromFriends:card];
    [self.cards removeObject:card];
}

- (void) removeCardFromFriends:(AddressCard *)card
{
    for (AddressCard *temp_card in self.cards)
    {
        [temp_card removeFriend:card];
    }
}

//- (void)sortCards
//{
//    NSArray *sortedCards;
//    sortedCards = [self.cards sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//        NSString *firstName = [(AddressCard *)a lastName];
//        NSString *secondName = [(AddressCard *)b lastName];
//        return [firstName compare:secondName];
//    }];
//    self.cards = [sortedCards mutableCopy];
//}

- (void)addCardSorted:(AddressCard *)card
{
    NSComparator comparator = ^NSComparisonResult(id a, id b) {
        NSString *firstName = [(AddressCard *)a lastName];
        NSString *secondName = [(AddressCard *)b lastName];
        return [firstName compare:secondName];
    };
    NSUInteger newIndex = [self.cards
                                indexOfObject:card
                                inSortedRange:(NSRange) {0, [self.cards count]}
                                options:NSBinarySearchingInsertionIndex
                                usingComparator:comparator];
    [self.cards insertObject:card atIndex:newIndex];

}

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

+ (AddressBook *)addressBookWithFile:(NSString *)path
{
    AddressBook *book = [[AddressBook alloc] init];
    NSMutableArray *loadedCards = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (loadedCards){
        book.cards = loadedCards;
    }
    [loadedCards release];
    return [book autorelease];
}

- (id) initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        self.cards = [decoder decodeObjectForKey:@"cards"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.cards forKey:@"cards"];
}

- (BOOL)saveToFile:(NSString*)path;
{
    BOOL saved = NO;
    if ([NSKeyedArchiver archiveRootObject:self.cards toFile:path]){
        saved = YES;
    }
    return saved;
}

- (NSArray *)findCardForLastName:(NSString *)lastName
{
    return [self.cards filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self.lastName == %@", lastName]];
}

- (void)dealloc
{
    [_cards release];
    [super dealloc];
}
@end
