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
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    var StatusBar:NSStatusItem!;
    var State:String!;
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        backgroundTask()
        
        StatusBar = statusItem
        
        StatusBar.image = NSImage(named: "media_pause")
        StatusBar.action = Selector("playPause:")
        
        let menu = NSMenu()
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
    
    func runCommand(cmd : String, args : String...) -> (output: [String], error: [String], exitCode: Int32) {
        
        var output : [String] = []
        var error : [String] = []
        
        let task = NSTask()
        task.launchPath = cmd
        task.arguments = args
        
        let outpipe = NSPipe()
        task.standardOutput = outpipe
        let errpipe = NSPipe()
        task.standardError = errpipe
        
        task.launch()
        
        let outdata = outpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String.fromCString(UnsafePointer(outdata.bytes)) {
            string = string.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
            output = string.componentsSeparatedByString("\n")
        }
        
        let errdata = errpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String.fromCString(UnsafePointer(errdata.bytes)) {
            string = string.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
            error = string.componentsSeparatedByString("\n")
        }
        
        task.waitUntilExit()
        let status = task.terminationStatus
        
        return (output, error, status)
    }

}

