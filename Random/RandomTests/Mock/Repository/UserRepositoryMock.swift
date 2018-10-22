//
//  UserRepositoryMock.swift
//  RandomTests
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Mockit
import XCTest

@testable import Random

class UserRepositoryMock: NSObject, Mock {
    let callHandler: CallHandler
    var activateHasUsers = true
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> UserRepositoryMock {
        return self
    }
}

extension UserRepositoryMock: UserRepositoryContract {
    func saveUsers(users: [User]) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func getUsers() -> Single<[User]> {
        let user = User()
        return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
    }
    
    func hasUsers() -> Bool {
        callHandler.accept(1, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
        return activateHasUsers
    }
    
    func getUsers(pagination: Pagination) -> Single<[User]> {
        let user = User()
        return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
    }
    
    func getUserById(id: String) -> Single<User> {
        let user = User()
        return callHandler.accept(Single.just(user), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<User>
    }
}
