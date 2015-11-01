//
//  AppDelegate.m
//  QuartzComposer To Cocoa App
//
//  Created by Mark C Mitchell on 1/12/2014.
//  Created by Mark C Mitchell on 1/12/2014.
//  Code borrowed from JFR / zanroversi at http://kineme.net/forum/DevelopingCompositions/MavericksDeprecation#comment-26422
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    qcView = [[QCView alloc] initWithFrame: [self.window.contentView frame]];
    [self.window.contentView addSubview:qcView];
    
    // Programmatically layout the QC View.
    // Cannot use xib/storyboard QC View anymore since Mavericks - brings up an error.
    [qcView setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(qcView);
    [self.window.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[qcView]|" options:0 metrics:nil views:views]];
    
    [self.window.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[qcView]|" options:0 metrics:nil views:views]];
    
    if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"QC Example" ofType:@"qtz"]])
    {
        NSLog(@"Quartz Composition failed to load.");
        [NSApp terminate:nil];
    }
    
    NSLog(@"Quartz Composition has been loaded");
    
    [qcView startRendering];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
