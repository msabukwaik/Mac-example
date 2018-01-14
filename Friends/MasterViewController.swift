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
	@IBOutlet weak var tblFriends: NSTableView!
	
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
		
		if age.integerValue < 1 && age.integerValue > 100{
			showErrorMessage(title: "Age is invalid", errorMessage: "Enter a valid age of your friend [1-100]")
			return
		}
		
		//Save friend
		sharedFriends.append(Friend(firstName: firstName.stringValue, lastName: lastName.stringValue, age: age.integerValue))
		
		
		// Reset fields
		firstName.stringValue = ""
		lastName.stringValue = ""
		age.integerValue = 1
		
		tblFriends.reloadData()
		
	}
	
	func showErrorMessage(title:String, errorMessage:String)  {
		let errorAlert = NSAlert()
		errorAlert.informativeText = errorMessage
		errorAlert.messageText = title
		errorAlert.alertStyle = .critical
		errorAlert.runModal()
	}
	
}

extension MasterViewController: NSTableViewDataSource{
	func numberOfRows(in tableView: NSTableView) -> Int {
		return sharedFriends.count
	}
	
	func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
		//print("row = \(row)")
		let cell:NSTableCellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: tableColumn!.identifier.rawValue), owner: self) as! NSTableCellView

		switch tableColumn!.identifier.rawValue {
		case "cellFirstName":
			cell.textField?.stringValue = sharedFriends[row].firstName
			
		case "cellSecondName":
			cell.textField?.stringValue = sharedFriends[row].lastName
			
		case "cellAge":
			cell.textField?.stringValue = String(describing: sharedFriends[row].age!)
			
		default:
			break
		}
		
		return cell
	}
}
