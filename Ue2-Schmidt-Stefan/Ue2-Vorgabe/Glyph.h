//
//  Glyph.h
//  Ue2-Vorgabe
//
//  Created by schlubbi on 23/10/13.
//  Copyright (c) 2013 kjung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drawing.h"
#import "PointXY.h"
#import "DrawHelper.h"

@interface Glyph : NSObject <Drawing>


@property (nonatomic, retain) PointXY *center;
@property (nonatomic, retain) UIColor *color;
@property CGFloat width;
@property bool showDescription;

@end
