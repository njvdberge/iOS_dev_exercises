//
//  BookController.m
//  Ue3-Vorgabe
//
//  Created by Klaus Jung on 31.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "BookController.h"
#import "AddressCard.h"
#import "AddressBook.h"
#import "IOHelper.h"

@interface BookController()
@property(nonatomic, retain) AddressBook *book;
- (void)enterCard;
- (void)lookupCard;
- (void)printBook;
- (void)addFriendToCard:(AddressCard *)card;
@end

@implementation BookController
@synthesize book = _book;


- (void)run {
    // TODO: read in address book from file @"book.archive"
    self.book = [AddressBook addressBookWithFile:@"book.archive"];
    // main loop

    NSString *ask = @"\n(E)ingabe, (S)uche, (L)iste oder (Q)uit?";
    char sel;
    
    while((sel = [IOHelper prompt:ask]) != 'q') {
        switch(sel) {
            case 'e':
                [self enterCard];
                break;
            case 's':
                [self lookupCard];
                break;
            case 'l':
                [self printBook];
                break;
        }
    }
    [self.book saveToFile:@"book.archive"];
    
}

- (void)enterCard {
    AddressCard *card = [[AddressCard alloc] init];
    [IOHelper printLineWithFormat:@"Neue Karte anlegen:"];
    // TODO: read in a new address card and add it to the book
    card.lastName = [IOHelper readLineWithMessage:@"Nachname:"];
    card.firstName = [IOHelper readLineWithMessage:@"Vorname"];
    card.street = [IOHelper readLineWithMessage:@"Strasse"];
    card.streetNumber = [IOHelper readIntegerNumberWithMessage:@"Hausnummer"];
    card.postalCode = [IOHelper readIntegerNumberWithMessage:@"Postleitzahl"];
    card.location = [IOHelper readLineWithMessage:@"Ort"];
    [self.book addCard:card];
    [card release];
}

- (void)lookupCard {
    NSString *searchName = [IOHelper readLineWithMessage:@"Suchname:"];
    AddressCard *card = [[self.book findCardForLastName:searchName] firstObject];
    // TODO: implement card search
    [self printCard:card];
    
    
    // TODO: if card is found, ask what to do with current card
    NSString *ask = @"(F)reund/in hinzufügen, (L)öschen oder (Z)urück?";
    char sel;
    
    while((sel = [IOHelper prompt:ask]) != 'z') {
        // TODO: implement appropriate action
        switch (sel) {
            case 'f':
                [self addFriendToCard:card];
                break;
            case 'L':
                [self.book removeCard:card];
                break;
        }
    }

}

- (void)addFriendToCard:(AddressCard *)card
{
    
}

- (AddressCard *)findCardByLastName
{
    NSString *searchName = [IOHelper readLineWithMessage:@"Suchname:"];
    AddressCard *card = [[self.book findCardForLastName:searchName] firstObject];

    return [card autorelease];
}

- (void)printBook {
    // TODO: print out all cards
    for (AddressCard *card in [self.book cards])
    {
        [self printCard:card];
    }
}

- (void)printCard:(AddressCard *)card
{
    [IOHelper printLineWithFormat:@"+-----------------------------------"];
    [IOHelper printLineWithFormat:@"| %@ %@", card.firstName, card.lastName];
    [IOHelper printLineWithFormat:@"| %@ %@", card.street, card.streetNumber];
    [IOHelper printLineWithFormat:@"| %@ %@", card.postalCode, card.location];
    [IOHelper printLineWithFormat:@"+-----------------------------------"];

}

@end
