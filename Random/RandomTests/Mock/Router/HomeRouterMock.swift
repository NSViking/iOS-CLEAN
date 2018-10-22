//
//  HomeRouterMock.swift
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

class HomeRouterMock: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> HomeRouterMock {
        return self
    }
}

extension HomeRouterMock: HomeRouterContract {

    func goToUserDetail(userId: String) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
