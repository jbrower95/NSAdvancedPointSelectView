//
//  NSView+NSView_LineIntersect.m
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "NSView+LineIntersect.h"

@implementation NSView (LineIntersect)

//TODO: Optimize this method
- (BOOL)intersectedByLine:(NSLineVec *)vec {
    
    CGVector vector = *(vec->vector);
    NSPoint point = *(vec->point);

    //trivial case: The line is nothing, and the point is inside the view.
    if (vector.dx == 0 && vector.dy == 0){
        if ([[self superview] hitTest:point] == self){
            return YES;
        }
    }
    
    //'point' is a copy of the point in the line vec, so we can mutate it.
    
    while (CGRectContainsPoint([[self superview] frame], point)){
        
        if ([[self superview] hitTest:point] == self){
            return YES;
        }
        
        point.x += vector.dx;
        point.y += vector.dy;
    }
    
    return NO;
}


@end
