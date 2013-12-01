//
//  Bank.h
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"


@interface Bank : NSObject
@property(nonatomic, retain) NSMutableDictionary *rates;
- (Money *)reduce:(id<Expression>) source to:(NSString *)sink;
- (double)rateFrom:(NSString *)oneCurrency to:(NSString *)anotherCurrency;
- (void)addRate:(double) rate from:(NSString *)oneCurrency to:(NSString *)anotherCurrency;

@end
