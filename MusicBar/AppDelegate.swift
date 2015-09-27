//
//  AppDelegate.swift
//  MusicBar
//
//  Created by Case Wright on 9/9/15.
//  Copyright © 2015 C453. All rights reserved.
//

import Cocoa
import Foundation
import SwiftShell

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let StatusBar = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    var State:String!
    var menu = NSMenu()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        backgroundTask()
        StatusBar.button!.image = NSImage(named: "media_pause")
        StatusBar.button!.action = Selector("playPause:")
        
        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "Q"))
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func backgroundTask() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
            while(true) {
            self.State = self.getItunesStatus()
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                switch(self.State) {
                    case "playing\n":
                        self.StatusBar.image = NSImage(named: "media_pause")
                    break
                default:
                    self.StatusBar.image = NSImage(named: "media_play")
                    break
                }
            })
            }
        })
    }
    
    func getItunesStatus() -> String {
       let output = run("osascript -e 'Tell application \"iTunes\" to player state'").read()
        return output
    }
    
    func playPause(sender: AnyObject) {
        if(self.State == "playing\n") {
            run("osascript -e 'Tell application \"iTunes\" to pause'")
        }
        else {
            run("osascript -e 'Tell application \"iTunes\" to play'")
        }
    }
}
