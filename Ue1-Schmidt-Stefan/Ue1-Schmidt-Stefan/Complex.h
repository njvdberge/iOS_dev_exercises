//
//  Complex.h
//  Ue1-Schmidt-Stefan
//
//  Created by schlubbi on 10/9/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tools.h"

@interface Complex : NSObject

@property (nonatomic) double imaginaryPart;
@property (nonatomic) double realPart;

- (void)setRealPart:(double) rp;
- (void)setImaginaryPart:(double) ip;
- (double)realPart;
- (double)imaginaryPart;
- (void)setWithRealPart:(double) rp andImaginaryPart:(double) ip;
- (void)print;
+ (Complex *)readFromConsole;
- (void)add:(Complex *) number;
- (void)multiplyWith:(Complex *) number;
- (void)rotateBy:(double) angle;
+ (id)complexWithRealPart:(double) rp andImaginaryPart:(double) ip;
@end
