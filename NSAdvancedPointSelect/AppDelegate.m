//
//  AppDelegate.m
//  NSAdvancedPointSelect
//
//  Created by Justin Brower on 11/29/14.
//  Copyright (c) 2014 Mediocre Stuff. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
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
