//
//  APIModuleTest.swift
//  RandomTests
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//
//  ******************************************
//
//  This test give us security if anyone change the URL wrong

import Foundation
import XCTest
import Moya

@testable import Random

class APIModuleTest: XCTestCase {
	
	func testGetUsersEndpoint() {
		
		let results = 5
		let baseUrl = "http://api.randomuser.me"
		
		let endpoint = APIModule.getProvider(baseurl: baseUrl).endpoint(APIModule.get(results: results))
		XCTAssertTrue(endpoint.method == .get)
		let completeURL = try! endpoint.urlRequest().url?.absoluteString
		XCTAssertTrue(completeURL == "\(baseUrl)/?results=\(results)")
	}
}
