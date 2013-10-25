//
//  Circle.m
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (void) paint
{
    [super paint];
    [DrawHelper drawCircleAtX:self.center.x y:self.center.y size:self.width color:self.color];

}
- (double)area
{
    return pow((self.width/2),2) * M_PI;
}
- (double)circumference
{
    return M_PI * self.width;
}
@end
