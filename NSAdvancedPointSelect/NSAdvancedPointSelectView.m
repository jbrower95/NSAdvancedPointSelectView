//
//  NSAdvancedPointSelectView.m
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "NSAdvancedPointSelectView.h"

@implementation NSAdvancedPointSelectView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    
    if ([self vecLength] > .000005){
        
        NSColor *color = [NSColor colorWithDeviceRed:136/255.0f green:136/255.0f blue:136/255.0f alpha:.5];
        [color set];
        
        //draw a rectangle over the selected button
        NSRectFill(tentativelySelectedView.frame);
        
        if (isSelectionVecVisible){
            
            NSBezierPath *path = [NSBezierPath bezierPath];
            [path moveToPoint:mouse];
            [path setLineWidth:lineWidth];
            
            NSPoint endPoint = mouse;
            //progress this point until it's out of view. this is an extremely ineffecient way of finding the point, but whatever.
            //there's probably a 4-case
            
            if (tentativelySelectedView != nil){
                while (!CGRectContainsPoint([tentativelySelectedView frame], endPoint)){
                    endPoint.x += selectionVec.dx;
                    endPoint.y += selectionVec.dy;
                }
            } else {
                while (CGRectContainsPoint([self frame], endPoint)){
                    endPoint.x += selectionVec.dx;
                    endPoint.y += selectionVec.dy;
                }
            }
            
            [path lineToPoint:endPoint];
            [[NSColor blackColor] set];
            [path stroke];
        }
        
    }
}

- (void)setSelectionLineVisible:(BOOL)isVisible {
    isSelectionVecVisible = isVisible;
}

//Sets the color of the line for previewing selection, and the color of the highlight.
- (void)setPointSelectColor:(NSColor *)color {
    pointSelectColor = color;
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    if ([self hitTest:[theEvent locationInWindow]] == tentativelySelectedView){
        return;
    }
    
    //Vector is short. Select!
    if (tentativelySelectedView != nil){
        // Create and post the event
        NSGraphicsContext *context = [NSGraphicsContext currentContext];
        
        NSEvent *mevent = [NSEvent mouseEventWithType:NSLeftMouseDown
                                             location:CGPointMake(CGRectGetMidX([tentativelySelectedView frame]),
                                                                  CGRectGetMidY([tentativelySelectedView frame]))
                                        modifierFlags:0
                                            timestamp:[theEvent timestamp]
                                         windowNumber:[self.window windowNumber]
                                              context:context
                                          eventNumber:1
                                           clickCount:1
                                             pressure:1.0];
        
        [[NSApplication sharedApplication] postEvent:mevent atStart:YES];
        
        
        mevent = [NSEvent mouseEventWithType:NSLeftMouseUp
                                             location:[tentativelySelectedView frame].origin
                                        modifierFlags:0
                                            timestamp:[theEvent timestamp]
                                         windowNumber:[self.window windowNumber]
                                              context:context
                                          eventNumber:1
                                           clickCount:1
                                             pressure:1.0];
        
        [[NSApplication sharedApplication] postEvent:mevent atStart:YES];
        
    }
}

//Sets the width of the selection line.
- (void)setLineWidth:(float)width {
    lineWidth = width;
}

//Returns the length of the selection vector
- (float)vecLength {
    return sqrtf((selectionVec.dx * selectionVec.dx) + (selectionVec.dy * selectionVec.dy));
}

- (void)viewDidMoveToWindow {
    // trackingRect is an NSTrackingRectTag instance variable
    // eyeBox is a region of the view (instance variable)
    isSelectionVecVisible = DEFAULT_LINE_ENABLED;
    lineWidth = DEFAULT_LINE_WIDTH;
    trackingRect = [self addTrackingRect:[self frame] owner:self userData:NULL assumeInside:NO];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    
    wasAcceptingMouseEvents = [[self window] acceptsMouseMovedEvents];
    [[self window] setAcceptsMouseMovedEvents:YES];
    [[self window] makeFirstResponder:self];
    
    //initialize the selection vector...
    selectionVec = CGVectorMake(0, 0);
    
    //get the location of the mouse and make it the last point
    mouse = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    [self displayIfNeeded];
}

- (void)mouseMoved:(NSEvent *)theEvent {
    NSPoint newMouse = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    selectionVec.dx = ((3 * selectionVec.dx) / 4) + ((1 * (newMouse.x - mouse.x)) / 4);
    selectionVec.dy = ((3 * selectionVec.dy) / 4) + ((1 * (newMouse.y - mouse.y)) / 4);
    
    //normalize...
    float len = sqrtf((selectionVec.dx * selectionVec.dx) + (selectionVec.dy * selectionVec.dy));
    
    selectionVec.dx /= len;
    selectionVec.dy /= len;
    
    mouse = newMouse;
    
    //try to tentatively select based off of the new selection vector
    [self tentativelySelect:&newMouse];

    [self setNeedsDisplay:true];
    [self displayIfNeeded];
}

//this method scans from the starting point in the direction of the selection vector
- (void)tentativelySelect:(NSPoint *)starting_point {
    
    NSLineVec lineVec;
    lineVec.point = starting_point;
    lineVec.vector = &selectionVec;
    
    for (NSView *view in [self subviews]){
        if ([view intersectedByLine:&lineVec]){
            //select this view... always select the first one
            tentativelySelectedView = view;
            return;
        }
    }
    
    tentativelySelectedView = nil;
}

- (void)mouseExited:(NSEvent *)theEvent {
    [[self window] setAcceptsMouseMovedEvents:wasAcceptingMouseEvents];
    selectionVec = CGVectorMake(0, 0);
    mouse = NSMakePoint(0,0);
    [self setNeedsDisplay:true];
    [self displayIfNeeded];
}


@end
