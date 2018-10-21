//
//  PictureData.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class PictureData: Codable {
	
	var large: String
	var medium: String
	var thumbnail: String
	
	class func decode(data: Data) -> PictureData {
		let decoder = JSONDecoder()
		let picture = try! decoder.decode(PictureData.self, from: data)
		return picture
	}
}
