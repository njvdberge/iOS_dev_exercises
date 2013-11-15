//
//  AddressBookTest.m
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AddressCard.h"
#import "AddressBook.h"

@interface AddressBookTest : XCTestCase
    @property (nonatomic, retain) AddressBook *book;
@end

@implementation AddressBookTest
@synthesize book;
- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    book = [[AddressBook alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [book release];
    [super tearDown];
}

- (void)testAddCard
{
    AddressCard *card = [[AddressCard alloc] init];
    [book addCard:card];
    XCTAssertEqualObjects([book cards][0], card);
    [card release];
}

- (void)testThatCardsAreOrderedByLastName
{
    AddressCard *card1 = [[AddressCard alloc] init];
    AddressCard *card2 = [[AddressCard alloc] init];
    
    card1.lastName = @"Zander";
    card2.lastName = @"Freud";
    
    [book addCard:card1];
    [book addCard:card2];
    
    XCTAssertEqualObjects([book.cards firstObject], card2, @"Cards are not ordered by name");
    [card1 release];
    [card2 release];
}
@end
