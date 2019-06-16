//
//  AppDelegate.h
//  Dog Age
//
//  Created by Jon Brown on 1/9/12.
//  Copyright (c) 2012 Food & Water Watch. All rights reserved.
//
import Cocoa
import WebKit

class AppDelegate : NSObject, NSApplicationDelegate {
    @IBOutlet var TxtShddow: NSTextField!
    @IBOutlet var TxtShddow2: NSTextField!
    @IBOutlet var TxtShddow3: NSTextField!
    @IBOutlet var window: NSWindow!
    @IBOutlet var arrowImage: NSButton!
    @IBOutlet var arrowImage2: NSButton!
    @IBOutlet var aButton: NSButton!
    @IBOutlet var aButton2: NSButton!
    @IBOutlet var graphView:WKWebView!
    @IBOutlet var prefSheet:NSWindow!
    @IBOutlet var secondView:NSView!
    
    @IBOutlet var popover: NSPopover!
    @IBOutlet var popcalc: NSPopover!
    @IBOutlet var poprevcalc: NSPopover!
    @IBOutlet var topView: NSView!
    @IBOutlet var view: NSView!
    
    
    // Setup the UA App Review Manager
    
    override init() {
        
    }
    
    @IBAction func showPopup(sender:AnyObject!) {

        self.popover.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .minY)
    }
    
    @IBAction func showCalc(sender:AnyObject!) {
        
        self.popcalc.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .minY)
        
    }
    
    @IBAction func showrevCalc(sender:AnyObject!) {
        
        self.poprevcalc.show(relativeTo: sender.bounds,
                          of: sender as! NSView,
                          preferredEdge: .minY)
    }
    
    
    func applicationDidFinishLaunching(aNotification:NSNotification!) {
       
        
    }
    
    
    func applicationShouldTerminateAfterLastWindowClosed(theApplication:NSApplication!) -> Bool {
        return true
    }
    
    override func awakeFromNib() {
        
        view.addSubview(topView)
        
        let defaults:UserDefaults! = UserDefaults.standard
        defaults.set(false, forKey:"flipPref")
        
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        graphView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        graphView.load(request)
        
        window.backgroundColor = NSColor(deviceRed:0.74, green:0.74, blue:0.74, alpha:1.0)
        
        let arrows:NSImage! = NSImage(named: "OppositeArrows")
        
        arrowImage.image = arrows
        arrowImage.alternateImage = arrows
        arrowImage2.image = arrows
        arrowImage2.alternateImage = arrows
        
        aButton.title = "Dog"
        aButton2.title = "Dog"
        window.title = "Dog Age"
        
    }
    
    func applicationWillFinishLaunching(aNotification:NSNotification!) {
        
    }
    
    @IBAction func isPref(sender:AnyObject!) {
        view.window?.beginSheet(prefSheet, completionHandler: { returnCode in
            print("completionHandler called")
        })
    }
    
    @IBAction func donePref(sender:AnyObject!) {
        prefSheet.orderOut(nil)
        view.window?.endSheet(prefSheet)
    }
}