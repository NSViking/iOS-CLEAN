//
//  UserRepositoryContract.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRepositoryContract {
	func getUsers(pagination: Pagination) -> Single<[User]>
}

enum UserRepositoryError: Swift.Error, CustomStringConvertible {
    var description: String { return "UserRepositoryError error" }
    case generic
}
