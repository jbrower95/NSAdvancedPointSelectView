//
//  NSView+NSView_LineIntersect.h
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef struct _NSLineVec {
    CGVector *vector;
    NSPoint *point;
} NSLineVec;


@interface NSView (LineIntersect)

//Returns true if the frame of the NSView is intersected by the given line vector
- (BOOL)intersectedByLine:(NSLineVec *)vec;

@end
