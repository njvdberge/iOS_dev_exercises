//
//  Square.m
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Square.h"

@implementation Square


-(void)paint
{
    [super paint];
    [DrawHelper drawSquareAtX:self.center.x y:self.center.y size:self.width color:self.color];
}
- (double)area
{
    return self.width * self.width;
}
- (double)circumference
{
    return 4 * self.width;
}
@end
