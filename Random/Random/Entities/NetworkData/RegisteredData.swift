//
//  RegisteredData.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class RegisteredData: Codable {
	var date: String
	var age: Int
	
	class func decode(data: Data) -> RegisteredData {
		let decoder = JSONDecoder()
		let registeredData = try! decoder.decode(RegisteredData.self, from: data)
		return registeredData
	}
}
