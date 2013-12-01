//
//  Money.h
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"

@interface Money : NSObject <Expression>

@property double amount;
@property(nonatomic, retain) NSString *currency;

- (BOOL)isEqual:(id)object;
- (Money *)times:(double)otherValue;
+ (Money *)moneyWithValue:(double)value andCurrency:(NSString *)currency;
+ (Money *)dollar:(double)amount;
+ (Money *)pound:(double)amount;
+ (Money *)euro:(double)amount;
- (NSString *)description;
- (NSObject<Expression> *)plus:(id<Expression>)added;
- (Money *)reduce:(Bank *)bank to:(NSString *) exchangeableCurrency;
@end
