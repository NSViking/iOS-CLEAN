//
//  UserRepositoryTests.swift
//  RandomTests
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import XCTest
import Moya
import RxSwift
import RxBlocking
import Mockit

@testable import Random

class UserRepositoryTests: XCTestCase {
	
	func testGetUsers() {
		let mockClient = HTTPClientMock(testCase: self)
        let mockDataBaseClient = DataBaseClientMock(testCase: self)
		let pagination = Pagination()
		pagination.setCurrentPage(page: 0)
		pagination.setObjectsPerPage(total: 0)
		
		let mockResponse: [UserData] = []
		let _ = mockClient.when()
			.call(withReturnValue: mockClient.getUsers(url: ""))
			.thenReturn(Single.just(mockResponse))
		
        let repo = UserRepository(httpClient: mockClient,
                                  dataBaseClient: mockDataBaseClient)
		do {
		let results = try repo.getUsers(pagination: pagination)
			.toBlocking(timeout: 1.0)
			.single()
			
			XCTAssert(results.count == pagination.getObjectsPerPage())
		} catch {
			XCTFail()
		}

		let _ = mockClient.verify(verificationMode: Once()).getUsers(url: "")
	}
}
