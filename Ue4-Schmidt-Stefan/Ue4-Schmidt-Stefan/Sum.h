//
//  Sum.h
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 01/12/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"

@interface Sum : NSObject <Expression>

@property(nonatomic, retain) id<Expression> augend;
@property(nonatomic, retain) id<Expression> added;

- (Money *)reduce:(Bank *)bank to:(NSString *)to;
+ (Sum *)sumWithAugend:(id<Expression>)augend andAdded:(id<Expression>)added;
- (id<Expression>)plus:(id<Expression>)added;
@end
