//
//  AppDelegate.swift
//  MusicBar
//
//  Created by Case Wright on 9/9/15.
//  Copyright © 2015 C453. All rights reserved.
//
import Cocoa
import Foundation
import ScriptingBridge

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak
    var window: NSWindow!
    let statusBar = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let pauseImage = NSImage(named: "media_pause")
    let playImage = NSImage(named: "media_play")
    var iTunes: iTunesApplication = SBApplication(bundleIdentifier: "com.apple.iTunes")!
    var menu = NSMenu()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let thread = NSThread(target: self, selector: "backgroundLoop", object: nil)
        thread.start()
        statusBar.button!.image = playImage
        statusBar.button!.action = Selector("playPause:")
        
        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "Q"))
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func backgroundLoop() {
        
        var image: NSImage!
        
        while true {
            usleep(100000) //0.1 Seconds
            if self.iTunes.playerState! == iTunesEPlSPlaying {
                self.statusBar.button!.image = pauseImage
                image = pauseImage
            } else {
                self.statusBar.button!.image = playImage
                image = playImage
            }
            
            guard image != self.statusBar.button!.image else { continue }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.statusBar.button!.image = image
            }
        }
    }
    
    func playPause(sender: AnyObject) {
        iTunes.playpause!()
    }
}