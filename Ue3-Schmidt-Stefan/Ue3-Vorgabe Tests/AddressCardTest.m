//
//  AddressCardTest.m
//  Ue3-Vorgabe
//
//  Created by schlubbi on 06/11/13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AddressCard.h"

@interface AddressCardTest : XCTestCase
    @property (nonatomic, retain) AddressCard *card;
@end

@implementation AddressCardTest
@synthesize card;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    card = [[AddressCard alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [card dealloc];
    [super tearDown];
}

- (void)testAddHobby
{
    NSString *hobby = @"TestHobby";
    [card addHobby:hobby];
    XCTAssertEqualObjects([card hobbies][0], hobby);
    [hobby release];
}

- (void)testRemoveHobby
{
    NSString *hobby = @"TestHobby";
    [card addHobby:hobby];
    [card removeHobby:hobby];
    XCTAssert([[card hobbies] count] == 0);
    [hobby release];
}

- (void)testAddFriend
{
    AddressCard *friend = [[AddressCard alloc] init];
    [card addFriend:friend];
    XCTAssertEqualObjects(card.friends[0], friend);
    [friend release];
}

- (void)testRemoveFriend
{
    AddressCard *friend = [[AddressCard alloc] init];
    [card addFriend:friend];
    [card removeFriend:friend];
    XCTAssert([[card friends] count] == 0);
    [friend release];
}

@end
