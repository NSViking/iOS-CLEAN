//
//  UserDataBase.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RealmSwift

class UserDataBase: Object {
    @objc dynamic var idUser = ""
    @objc dynamic var title = ""
    @objc dynamic var first = ""
    @objc dynamic var last = ""
    @objc dynamic var email = ""
    @objc dynamic var phone = ""
    @objc dynamic var gender = ""
    @objc dynamic var picture = ""
    @objc dynamic var registered = ""
    @objc dynamic var location: LocationDataBase? = nil
    @objc dynamic var deleted = 0
}
