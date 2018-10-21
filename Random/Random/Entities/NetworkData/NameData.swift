//
//  Name.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class NameData: Codable {
	var title: String
	var firstName: String
	var lastName: String

	class func decode(data: Data) -> NameData {
		let decoder = JSONDecoder()
		let name = try! decoder.decode(NameData.self, from: data)
		return name
	}
}

