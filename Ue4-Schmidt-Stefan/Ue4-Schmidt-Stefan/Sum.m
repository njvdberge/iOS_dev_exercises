//
//  Sum.m
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 01/12/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import "Money.h"
#import "Sum.h"



@implementation Sum : NSObject
@synthesize added = _added;
@synthesize augend = _augend;
+(Sum *)sumWithAugend:(Money *)augend andAdded:(Money *)added
{
    Sum *sum = [[self alloc] init];
    sum.augend = augend;
    sum.added = added;
    return [sum autorelease];
}

- (Money *)reduce:(Bank *)bank to:(NSString *)to
{
    int amount = [[self.augend reduce:bank to:to ] amount] + [[self.added reduce:bank to:to]amount];
    return [Money moneyWithValue:amount andCurrency:to];
}

- (id<Expression>)plus:(id<Expression>)added
{
    return [Sum sumWithAugend:self andAdded:added];
}
@end
