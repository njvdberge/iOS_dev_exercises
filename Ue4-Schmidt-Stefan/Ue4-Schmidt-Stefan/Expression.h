//
//  Expression.h
//  Ue4-Schmidt-Stefan
//
//  Created by schlubbi on 20/11/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money, Bank;
@protocol Expression <NSObject>
- (Money *)reduce:(Bank *)bank to:(NSString *)to;
- (NSObject <Expression> *)plus:(id<Expression>)added;
@end
