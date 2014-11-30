//
//  AppDelegate.m
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "AppDelegate.h"
#import "NSAdvancedPointSelectView.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
    //Initialize the sample!
    NSAdvancedPointSelectView *pointSelect = (NSAdvancedPointSelectView *)[[self window] contentView];

    NSColor *color = [NSColor colorWithDeviceRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:.5];
    
    [pointSelect setPointSelectColor:color];
    [pointSelect setSelectionLineVisible:NO];
    [pointSelect setLineWidth:2.0];
    
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)buttonOne:(id)sender {
    [[NSAlert alertWithMessageText:@"Hey There (1)" defaultButton:@"Okay" alternateButton:@"Nah" otherButton:@"Meep" informativeTextWithFormat:@"This is just a text, really."] runModal];
}
- (IBAction)buttonTwo:(id)sender {
     [[NSAlert alertWithMessageText:@"Hey There (2)" defaultButton:@"Okay" alternateButton:@"Nah" otherButton:@"Meep" informativeTextWithFormat:@"This is just a text, really."] runModal];
}


@end
