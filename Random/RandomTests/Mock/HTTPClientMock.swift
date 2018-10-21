//
//  HTTPClientMock.swift
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

class HTTPClientMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> HTTPClientMock {
		return self
	}
}

extension HTTPClientMock: HTTPClientContract {
	
	func getUsers(url: String) -> Single<[UserData]> {
		let userData = UserData()
		return callHandler.accept(Single.just([userData]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[UserData]>
	}
}
