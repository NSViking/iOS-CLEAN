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
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> UserRepositoryMock {
        return self
    }
}

extension UserRepositoryMock: UserRepositoryContract {
    
    func getUsers(pagination: Pagination) -> Single<[User]> {
        let user = User()
        return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
    }
    
    func getUserById(id: String) -> Single<User> {
        let user = User()
        return callHandler.accept(Single.just(user), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<User>
    }
}
