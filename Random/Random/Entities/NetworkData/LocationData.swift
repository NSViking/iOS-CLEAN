//
//  LocationData.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class LocationData: Codable {
	var street: String
	var city: String
	var state: String
    var coordinates: Coordinates?
	
	class func decode(data: Data) -> LocationData {
		let decoder = JSONDecoder()
		let locationData = try! decoder.decode(LocationData.self, from: data)
		return locationData
	}
}
