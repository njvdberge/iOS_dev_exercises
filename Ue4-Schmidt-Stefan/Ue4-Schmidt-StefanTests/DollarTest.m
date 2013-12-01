//
//  DollarTest.m
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Expression.h"
#import "Sum.h"
#import "Bank.h"


@interface DollarTest : XCTestCase

@end

@implementation DollarTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testEquality
{
    XCTAssert([[Money dollar:5] isEqual: [Money dollar:5]]);
    XCTAssertFalse([[Money dollar:5] isEqual: [Money dollar:6]]);
    XCTAssert([[Money pound:5] isEqual: [Money pound:5]]);
    XCTAssertFalse([[Money pound:5] isEqual: [Money pound:6]]);
    XCTAssertFalse([[Money pound:5] isEqual: [Money dollar:5]]);
}

- (void)testCurrency
{
    XCTAssert([@"USD" isEqualToString: [[Money dollar:1] currency]]);
    XCTAssert([@"GBP" isEqualToString: [[Money pound:1] currency]]);
    
}

- (void)testReduceMoneyWithDifferenetCurrency
{
    id<Expression> fiveDollar = [Money dollar:5];
    id<Expression> tenPound = [Money pound:10];
    Bank *bank = [[Bank alloc] init];
    [bank addRate:2 from:@"GBP" to:@"USD"];
    id<Expression> sum = [[Sum sumWithAugend:fiveDollar andAdded:tenPound] plus:fiveDollar];
    Money *result = [bank reduce:sum to:@"USD"];
    XCTAssertTrue([[Money dollar:15] isEqual:result]);
}

@end
