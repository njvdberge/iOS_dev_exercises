//
//  PointXY.h
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PointXY : NSObject

@property CGFloat x;
@property CGFloat y;

- (void)setX:(CGFloat)x andY:(CGFloat)y;
+ (PointXY *)pointXYWith:(CGFloat)x andY:(CGFloat)y;
@end
