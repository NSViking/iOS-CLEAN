//
//  Coordinates.swift
//  Random
//
//  Created by VITI on 23/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class Coordinates: Codable {
    var latitude: String
    var longitude: String
    
    class func decode(data: Data) -> Coordinates {
        let decoder = JSONDecoder()
        let locationData = try! decoder.decode(Coordinates.self, from: data)
        return locationData
    }
}
