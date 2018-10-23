//
//  User.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class User {
    var id: String = ""
	var name: String = ""
	var lastname: String = ""
	var picture: String = ""
    var email: String = ""
	var phone: String = ""
	var gender: String = ""
	var registeredDate: String = ""
	var street: String = ""
	var city: String = ""
	var state: String = ""
    var latitude: String = ""
    var longitude: String = ""
}

enum Gender: String {
    case female = "female", male = "male"
}
