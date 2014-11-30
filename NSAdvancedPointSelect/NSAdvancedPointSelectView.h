//
//  NSAdvancedPointSelectView.h
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+LineIntersect.h"

//this marks the width of the line...
#define LINE_WIDTH 2

/**
  * This class should work with any type of subview with a rectangular bounding box.
  * It allows the user to move slightly towards a selectable item, and 'tentatively' select the item.
  *
  * - If the user stops moving, the item is selected.
  * - If the user breaks the chain, selection is removed (moving in a different direction)
  *
  * This should allow for a significant speedup in selection! This view class can be substituted in anywhere
  * an NSView is used. I will also port a version of this hack using UIView for use with iOS.
  *
  *
  * TODO: I'm sure there are better ways to calculate the expected click (more effecient)
  *
  */
@interface NSAdvancedPointSelectView : NSView {
    
    //the reference to the selected view.
    NSView *tentativelySelectedView;
    
    //the current selection vector
    CGVector selectionVec;
    
    //whether or not the selection vector is drawn. by default, this is true.
    BOOL isSelectionVecVisible;
    
    //whether or not the window was previously accepting mouse events
    BOOL wasAcceptingMouseEvents;
    
    //the last location of the mouse
    NSPoint mouse;
    
    //tracking rect
    NSTrackingRectTag trackingRect;
    
}


//If set, the view will internally draw the selection line.
- (void)setSelectionLineVisible:(BOOL)isVisible;


@end
