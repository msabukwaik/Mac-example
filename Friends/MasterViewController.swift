//
//  MasterViewController.swift
//  Friends
//
//  Created by Mohammed S A Kwaik on 1/13/18.
//  Copyright © 2018 Mohammed S A Kwaik. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {
	@IBOutlet weak var firstName: NSTextField!
	@IBOutlet weak var lastName: NSTextField!
	@IBOutlet weak var age: NSComboBox!
	@IBOutlet weak var friendsList: NSTextField!
	
	var sharedFriends:[Friend] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		
		age.removeAllItems()
		for i in 1...100 {
			age.addItem(withObjectValue: i)
		}
		
		age.integerValue = 1
    }
	@IBAction func saveBtn(_ sender: Any) {
		sharedFriends.append(Friend(firstName: firstName.stringValue, lastName: lastName.stringValue, age: age.integerValue))
		friendsList.stringValue = ""
		for friend in sharedFriends {
			friendsList.stringValue = "\(friendsList.stringValue) \n Name : \(friend.firstName) \(friend.lastName) age : \(age.stringValue) \n"
		}
		
		firstName.stringValue = ""
		lastName.stringValue = ""
		age.integerValue = 1
		
	}
	
}
