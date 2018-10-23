//
//  HomeInteractorMock.swift
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

class HomeInteractorMock: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> HomeInteractorMock {
        return self
    }
}

extension HomeInteractorMock: HomeInteractorContract {
	func removeUser(id: String) {
		callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
	}
	
	func filterUsers(nameToSearch: String) -> Single<[User]> {
		let user = User()
		return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
	}
	
    
    func getUsers() -> Single<[User]> {
        let user = User()
        return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
    }
    
    func getMoreUsers() -> Single<[User]> {
        let user = User()
        return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[User]>
    }
}
