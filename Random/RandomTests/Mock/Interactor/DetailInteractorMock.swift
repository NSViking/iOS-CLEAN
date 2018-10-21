//
//  DetailInteractorMock.swift
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

class DetailInteractorMock: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> DetailInteractorMock {
        return self
    }
}

extension DetailInteractorMock: DetailInteractorContract {
    
    func getUserBy(id: String) -> Single<User> {
        let user = User()
        return callHandler.accept(Single.just(user), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<User>
    }
}
