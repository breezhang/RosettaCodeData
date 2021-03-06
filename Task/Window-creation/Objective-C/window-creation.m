#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

@interface Win : NSWindow
{
}
- (void)applicationDidFinishLaunching: (NSNotification *)notification;
- (BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSNotification *)notification;
@end


@implementation Win : NSWindow
-(id) init
{
  [self
    initWithContentRect: NSMakeRect(0, 0, 800, 600)
    styleMask: (NSTitledWindowMask | NSClosableWindowMask)
    backing: NSBackingStoreBuffered
    defer: NO];

  [self setTitle: @"A Window"];
  [self center];

  return self;
}


-(void) dealloc
{
  [super dealloc];
}

- (void)applicationDidFinishLaunching: (NSNotification *)notification
{
  [self orderFront: self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSNotification *)notification
{
  return YES;
}
@end

int main()
{
  Win *mywin;
  NSAutoreleasePool *pool;

  pool = [[NSAutoreleasePool alloc] init];
  [NSApplication sharedApplication];
  mywin = [[Win alloc] init];
  [NSApp setDelegate: mywin];
  [NSApp runModalForWindow: mywin];
  return EXIT_SUCCESS;
}
