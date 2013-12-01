//
//  Money.m
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import "Money.h"
#import "Sum.h"
#import "Bank.h"

@implementation Money
@synthesize amount = _amount;
@synthesize currency = _currency;

+ (Money *)moneyWithValue:(double)value andCurrency:(NSString *)currency
{
    Money *m = [[self alloc] init];
    m.amount = value;
    m.currency = currency;
    return [m autorelease];
}
- (BOOL)isEqual:(id)object
{
    return (self.amount == [(Money *)object amount]) && ([self.currency  isEqualToString: [(Money *)object currency]]);
}

+ (Money *)dollar:(double)amount
{
    return [Money moneyWithValue:amount andCurrency:@"USD"];
}

+ (Money *)pound:(double)amount
{
    return [Money moneyWithValue:amount andCurrency:@"GBP"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@" %lf %@", self.amount, self.currency];
}

- (NSObject <Expression> *)plus:(id<Expression>)added
{
    return [Sum sumWithAugend:self andAdded:added];
}

- (Money *)reduce:(Bank *)bank to:(NSString *) exchangeableCurrency
{
    double rate = [bank rateFrom:self.currency to:exchangeableCurrency];
    return [Money moneyWithValue:(self.amount / rate) andCurrency:exchangeableCurrency];
}


@end
