//
//  PointXY.m
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "PointXY.h"

@implementation PointXY

- (void)setX:(CGFloat)x andY:(CGFloat)y
{
    self.x = x;
    self.y = y;
}

+ (PointXY *)pointXYWith:(CGFloat)x andY:(CGFloat)y
{
    PointXY *p = [[self alloc] init];
    [p setX:x andY:y];
    return [p autorelease];
}


@end
