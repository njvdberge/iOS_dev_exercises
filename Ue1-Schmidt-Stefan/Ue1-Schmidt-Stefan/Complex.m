//
//  Complex.m
//  Ue1-Schmidt-Stefan
//
//  Created by schlubbi on 10/9/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import "Complex.h"

@implementation Complex


+ (Complex *) readFromConsole
{
    KJLog(@"Please enter real and imaginary part");
    KJLog(@"Real part:");
    double realPart = KJReadDouble();
    KJLog(@"Imaginary part:");
    double imaginaryPart = KJReadDouble();
    Complex *number = [Complex complexWithRealPart:realPart
                                  andImaginaryPart:imaginaryPart];
    return number;
}

- (void) print
{
    KJLog(@"%.01lf %+.01lf i", self.realPart, self.imaginaryPart);
}

- (void) setWithRealPart:(double)rp andImaginaryPart:(double)ip
{
    self.realPart = rp;
    self.imaginaryPart = ip;
}

- (void) add:(Complex *) number
{
    self.realPart += number.realPart;
    self.imaginaryPart += number.imaginaryPart;
}


- (void) multiplyWith:(Complex *) number
{
    double tmpRealPart = self.realPart;
    double tmpImaginaryPart = self.imaginaryPart;
    self.realPart = (tmpRealPart * number.realPart)
                    - (tmpImaginaryPart * number.imaginaryPart);
    self.imaginaryPart = (tmpRealPart * number.imaginaryPart)
                         + (tmpImaginaryPart * number.realPart);
}

- (void) rotateBy:(double) angle
{
    double sin = sinf(angle);
    double cosin = cosf(angle);
    Complex * rotatedNumber = [Complex complexWithRealPart:cosin
                                        andImaginaryPart:sin];
    [self multiplyWith: rotatedNumber];
}

+ (id) complexWithRealPart:(double)rp andImaginaryPart:(double)ip
{
    Complex *c = [[self alloc] init];
    c.realPart = rp;
    c.imaginaryPart = ip;
    return [c autorelease];
}
@end
