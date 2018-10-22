//
//  LocationDataBase.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RealmSwift

class LocationDataBase: Object {
    @objc dynamic var street = ""
    @objc dynamic var city = ""
    @objc dynamic var state = ""
}
