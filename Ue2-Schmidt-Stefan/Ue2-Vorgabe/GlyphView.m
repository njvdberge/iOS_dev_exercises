//
//  GlyphView.m
//  Ue2-Vorgabe
//
//  Created by Klaus Jung on 18.10.13.
//  Copyright (c) 2013 Klaus Jung. All rights reserved.
//

#import "GlyphView.h"

@implementation GlyphView


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark Change Handlers

- (void)glyph:(int)index changedPositionX:(CGFloat)x positionY:(CGFloat)y
{
    PointXY *p = [PointXY pointXYWith:x andY:y];
    Glyph *g = [self.glyphs objectAtIndex:index];
    [g setCenter:p];
}

- (void)glyph:(int)index changedType:(int)typeIndex
{
    
    Glyph *new_glyph = [[@[[Square class], [Circle class], [Triangle class]][typeIndex] alloc] init];
    Glyph *old_glyph = [self.glyphs objectAtIndex:index];
    new_glyph.center = old_glyph.center;
    new_glyph.color = old_glyph.color;
    new_glyph.width = old_glyph.width;
    [self.glyphs replaceObjectAtIndex:index withObject:new_glyph];
    [new_glyph release];
}

- (void)glyph:(int)index changedColor:(UIColor*)color
{
    Glyph *g = [self.glyphs objectAtIndex:index];
    g.color = color;
}

- (void)glyph:(int)index changedSize:(CGFloat)size
{
    Glyph *g = [self.glyphs objectAtIndex:index];
    g.width = size;
}

- (void)glyph:(int)index showDescription:(BOOL)show
{
    Glyph *g = [self.glyphs objectAtIndex:index];
    g.showDescription = show;
}
- (NSMutableArray *)glyphs
{
    if (_glyphs == nil)
    {
        Glyph *glyph = [[Glyph alloc] init];
        _glyphs = [[NSMutableArray alloc] initWithObjects: glyph, glyph, glyph, nil];
        [glyph release];
    }
    return _glyphs;
    
}

#pragma mark Drawing

- (void)drawRect:(CGRect)rect
{
    for (Glyph *glyph in self.glyphs)
    {
        [glyph paint];
    }
}


@end
