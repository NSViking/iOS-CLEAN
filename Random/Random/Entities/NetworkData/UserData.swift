//
//  User.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class UserData: Codable {
    var id: IdUser?
	var name: NameData?
    var email: String = ""
	var phone: String = ""
	var gender: String = ""
    var picture: PictureData?
    var registered: RegisteredData?
    var location: LocationData?
	
	class func decode(data: Data) -> UserData {
		let decoder = JSONDecoder()
		let userData = try! decoder.decode(UserData.self, from: data)
		return userData
	}
}
