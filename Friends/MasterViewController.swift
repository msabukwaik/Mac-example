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
		
		//Checking data
		if firstName.stringValue.isEmpty{
			showErrorMessage(title: "First name is empty", errorMessage: "Enter a valid first name of your friend")
			return
		}
		
		if lastName.stringValue.isEmpty{
			showErrorMessage(title: "Last name is empty", errorMessage: "Enter a valid last name of your friend")
			return
		}
		
		if age.integerValue >= 1 && age.integerValue <= 100{
			showErrorMessage(title: "Age is invalid", errorMessage: "Enter a valid age of your friend [1-100]")
			return
		}
		
		//Save friend
		sharedFriends.append(Friend(firstName: firstName.stringValue, lastName: lastName.stringValue, age: age.integerValue))
		
		
		// Show friends
		friendsList.stringValue = ""
		for friend in sharedFriends {
			friendsList.stringValue = "\(friendsList.stringValue) \n Name : \(friend.firstName) \(friend.lastName) age : \(age.stringValue) \n"
		}
		
		// Reset fields
		firstName.stringValue = ""
		lastName.stringValue = ""
		age.integerValue = 1
		
	}
	
	func showErrorMessage(title:String, errorMessage:String)  {
		let errorAlert = NSAlert()
		errorAlert.informativeText = errorMessage
		errorAlert.messageText = title
		errorAlert.alertStyle = .critical
		errorAlert.runModal()
	}
	
}
