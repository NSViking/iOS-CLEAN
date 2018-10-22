//
//  DataBaseClient.swift
//  RandomTests
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Mockit
import XCTest

@testable import Random

class DataBaseClientMock: NSObject, Mock {
    let callHandler: CallHandler
    var activateHasUsers = true
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> DataBaseClientMock {
        return self
    }
    
}

extension DataBaseClientMock: DataBaseClientContract {
    func getUsers() -> Single<[UserDataBase]> {
        let userData = UserDataBase()
        return callHandler.accept(Single.just([userData]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[UserDataBase]>
    }
    
    func getUserBy(id: String) -> Single<UserDataBase> {
        let userData = UserDataBase()
        return callHandler.accept(Single.just(userData), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<UserDataBase>
    }
    
    func saveUsers(users: [UserDataBase]) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func hasUsers() -> Bool {
        return activateHasUsers
    }
}
