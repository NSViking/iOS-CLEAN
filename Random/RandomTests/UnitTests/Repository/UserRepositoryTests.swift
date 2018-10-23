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
	
	var mockClient: HTTPClientMock!
	var mockDataBaseClient: DataBaseClientMock!
	
	override func setUp() {
		mockClient = HTTPClientMock(testCase: self)
		mockDataBaseClient = DataBaseClientMock(testCase: self)
	}
	
	func testGetUsers() {
		
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
	
	func testGetUserById() {
		let mockResponse: UserDataBase = UserDataBase()
		let _ = mockDataBaseClient.when()
			.call(withReturnValue: mockDataBaseClient.getUserBy(id: ""))
			.thenReturn(Single.just(mockResponse))
		
		let repo = UserRepository(httpClient: mockClient,
								  dataBaseClient: mockDataBaseClient)
		do {
			let result = try repo.getUserById(id: "")
				.toBlocking(timeout: 1.0)
				.single()
			
			XCTAssertNotNil(result)
		} catch {
			XCTFail()
		}
		
		let _ = mockDataBaseClient.verify(verificationMode: Once()).getUserBy(id: "")
	}
	
	func testGetUsersContains() {
		let mockResponse: [UserDataBase] = [UserDataBase()]
		let _ = mockDataBaseClient.when()
			.call(withReturnValue: mockDataBaseClient.getUsersContains(data: ""))
			.thenReturn(Single.just(mockResponse))
		
		let repo = UserRepository(httpClient: mockClient,
								  dataBaseClient: mockDataBaseClient)
		do {
			let result = try repo.filterUsers(nameToSearch: "")
				.toBlocking(timeout: 1.0)
				.single()
			
			XCTAssertTrue(result.count == 1)
		} catch {
			XCTFail()
		}
		
		let _ = mockDataBaseClient.verify(verificationMode: Once()).getUsersContains(data: "")
	}
	
	func testSaveUser() {
		
		let repo = UserRepository(httpClient: mockClient,
								  dataBaseClient: mockDataBaseClient)
		repo.saveUsers(users: [])
		
		let _ = mockDataBaseClient.verify(verificationMode: Once()).saveUsers(users: [])
	}
	
	func testRemoveUser() {
		
		let repo = UserRepository(httpClient: mockClient,
								  dataBaseClient: mockDataBaseClient)
		repo.removeUser(id: "")
		
		let _ = mockDataBaseClient.verify(verificationMode: Once()).removeUser(id: "")
	}
}
