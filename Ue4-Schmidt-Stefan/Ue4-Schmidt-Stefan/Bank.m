//
//  Bank.m
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import "Bank.h"
#import "Sum.h"

@implementation Bank

-(NSMutableDictionary *)rates
{
    if (_rates == nil)
    {
        _rates = [NSMutableDictionary dictionaryWithCapacity:6];
    }
    return _rates;
}

- (Money *)reduce:(id<Expression>) source to:(NSString *)sink
{
    return [source reduce:self to:sink];
}

-(double)rateFrom:(NSString *)oneCurrency to:(NSString *)anotherCurrency
{
    if ([oneCurrency isEqualToString:anotherCurrency])
    {
        return 1;
    }
    NSString *key = [NSString stringWithFormat:@"%@:%@", oneCurrency, anotherCurrency];
    return [[self.rates objectForKey:key] doubleValue];
}

- (void)addRate:(double) rate from:(NSString *)oneCurrency to:(NSString *)anotherCurrency
{
    NSString *key = [NSString stringWithFormat:@"%@:%@", oneCurrency, anotherCurrency];
    [self.rates setObject:[NSNumber numberWithDouble:rate] forKey:key];
}

@end
