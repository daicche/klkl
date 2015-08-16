//
//  AppDelegate.swift
//  glgl
//
//  Created by dch on 8/15/15.
//  Copyright (c) 2015 co.l0o0l. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
                NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.FlagsChangedMask, handler: handlerEvent)
    }
    var prevTimeInterval = 0.0
    
    func handlerEvent(aEvent: (NSEvent!)) -> Void {
        setShortCut(NSEventModifierFlags.CommandKeyMask.rawValue, app_name: "Google Chrome", aEvent: aEvent)
        setShortCut(NSEventModifierFlags.ShiftKeyMask.rawValue, app_name: "iTerm", aEvent: aEvent)
    }
    
    func setShortCut(key_uint: UInt, app_name: NSString, aEvent: NSEvent) {
        if aEvent.modifierFlags.rawValue & key_uint > 0 {
            println("key pressed")
            if (aEvent.timestamp - prevTimeInterval < 0.2) {
                println( "double key pressed" );
                if theWorkspace.launchApplication(app_name as String){
                    NSLog("OK")
                } else {
                    NSLog("NO")
                }
            }
            prevTimeInterval = aEvent.timestamp;
        }
    }
    
//    func applicationWillTerminate(aNotification: NSNotification) {
//        Insert code here to tear down your application
//    }
}