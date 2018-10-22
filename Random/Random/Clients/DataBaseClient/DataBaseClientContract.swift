//
//  DataBaseClientContract.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

protocol DataBaseClientContract {
    func getUsers() -> Single<[UserDataBase]>
}

enum DataBaseClientError: Swift.Error, CustomStringConvertible {
    var description: String { return "DataBaseClientError.." }
    case genericError
}


