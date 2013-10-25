//
//  Glyph.m
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Glyph.h"

@implementation Glyph


- (void)paint
{
    if (self.showDescription)
    {
        [DrawHelper drawDescriptionArea:[self area] circumference:[self circumference] atX:self.center.x y:self.center.y - self.width];
    }
}
- (double)area
{
    return 0.0;
}
- (double)circumference
{
    return 0.0;
}
- (void) dealloc
{
    [_center release];
    [_color release];
    [super dealloc];
}
@end
