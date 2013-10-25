//
//  Triangle.m
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle
- (void)paint
{
    [super paint];
    [DrawHelper drawTriangleAtX:self.center.x y:self.center.y size:self.width color:self.color];
}
- (double)area
{
    return (0.5 * self.width) * self.width;
}
- (double)circumference
{
    return 3 * self.width;
}
@end
