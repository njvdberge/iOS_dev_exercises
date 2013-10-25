//
//  main.m
//  Ue1-Schmidt-Stefan
//
//  Created by schlubbi on 10/9/13.
//  Copyright (c) 2013 schlubbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tools.h"
#import "Complex.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Complex *userNumber = [Complex readFromConsole];
        Complex *summand = [Complex complexWithRealPart:1.2
                                       andImaginaryPart:2.4];

        [userNumber add:summand];
        KJLog(@"Your number added to (1.2 + 2.4 i):");
        [userNumber print];
        Complex *factor = [Complex complexWithRealPart:0.0
                                      andImaginaryPart:1.0];
        
        [userNumber multiplyWith:factor];
        KJLog(@"Result muliplied by: (0.0 + 1.0 i):");
        [userNumber print];
        [userNumber rotateBy:3.1415927];
        KJLog(@"Result rotated by pi:");
        [userNumber print];
    }
    return 0;
}

