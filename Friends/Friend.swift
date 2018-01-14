//
//  Friend.swift
//  Friends
//
//  Created by Mohammed S A Kwaik on 1/13/18.
//  Copyright © 2018 Mohammed S A Kwaik. All rights reserved.
//

import Foundation

class Friend {
	var firstName:String!
	var lastName:String!
	var age:Int!
	
	required init(firstName:String, lastName: String, age:Int?) {
		self.firstName = firstName
		self.lastName = lastName
		self.age = age
	}
	
}
