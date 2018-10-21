//
//  HomeViewMock.swift
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

class HomeViewMock: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> HomeViewMock {
        return self
    }
}

extension HomeViewMock: HomeViewContract {
    func showError() {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func reloadData() {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    
}
