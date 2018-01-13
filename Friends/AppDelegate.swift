//
//  AppDelegate.swift
//  Friends
//
//  Created by Mohammed S A Kwaik on 1/13/18.
//  Copyright © 2018 Mohammed S A Kwaik. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!

	var masterViewController:MasterViewController!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		
		masterViewController = MasterViewController(nibName: NSNib.Name(rawValue: "MasterViewController"), bundle: nil)
		window.contentView!.addSubview(masterViewController.view)
		
		masterViewController.view.frame = window.contentView!.bounds
		
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

