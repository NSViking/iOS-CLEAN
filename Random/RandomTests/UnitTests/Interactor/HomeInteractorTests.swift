//
//  HomeInteractorTests.swift
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

class HomeInteractorTests: XCTestCase {
	
	func testGetUsersLocal() {
        let mockRepo = UserRepositoryMock(testCase: self)
        let pagination = Pagination()
        
        let mockResponse: [User] = []
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers())
            .thenReturn(Single.just(mockResponse))
        
        let interactor = HomeInteractor(repo: mockRepo, pagination: pagination)
        
        do {
            let results = try interactor.getUsers()
                .toBlocking()
                .single()
            XCTAssertTrue(results.count == 0)
            XCTAssertTrue(interactor.pagination.getCurrentPage() == 0)
        } catch {
            XCTFail()
        }
        
        let _ = mockRepo.verify(verificationMode: Once()).getUsers()
	}
    
    func testGetUsersCloud() {
        let mockRepo = UserRepositoryMock(testCase: self)
        let pagination = Pagination()
        mockRepo.activateHasUsers = false
        
        let mockResponse: [User] = []
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers(pagination: pagination))
            .thenReturn(Single.just(mockResponse))
        
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers())
            .thenReturn(Single.just(mockResponse))
        
        let interactor = HomeInteractor(repo: mockRepo, pagination: pagination)
        
        do {
            let results = try interactor.getUsers()
                .toBlocking()
                .single()
            XCTAssertTrue(results.count == 0)
            XCTAssertTrue(interactor.pagination.getCurrentPage() == 0)
        } catch {
            XCTFail()
        }
        
        let _ = mockRepo.verify(verificationMode: Once()).getUsers(pagination: pagination)
        let _ = mockRepo.verify(verificationMode: Once()).saveUsers(users: [])
        let _ = mockRepo.verify(verificationMode: Once()).getUsers()
    }
    
    func testGetMoreUsers() {
        let mockRepo = UserRepositoryMock(testCase: self)
        let pagination = Pagination()
        mockRepo.activateHasUsers = false
        
        let mockResponse: [User] = []
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers(pagination: pagination))
            .thenReturn(Single.just(mockResponse))
        
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers())
            .thenReturn(Single.just(mockResponse))
        
        let interactor = HomeInteractor(repo: mockRepo, pagination: pagination)
        
        do {
            let results = try interactor.getMoreUsers()
                .toBlocking()
                .single()
            XCTAssertTrue(results.count == 0)
            XCTAssertTrue(interactor.pagination.getCurrentPage() == 1)
        } catch {
            XCTFail()
        }
        
        let _ = mockRepo.verify(verificationMode: Once()).getUsers(pagination: pagination)
        let _ = mockRepo.verify(verificationMode: Once()).saveUsers(users: [])
        let _ = mockRepo.verify(verificationMode: Once()).getUsers()
    }
	
	func testFilterUsers() {
		let mockRepo = UserRepositoryMock(testCase: self)
		let pagination = Pagination()
		
		let mockResponse: [User] = []
		let _ = mockRepo.when()
			.call(withReturnValue: mockRepo.filterUsers(nameToSearch: ""))
			.thenReturn(Single.just(mockResponse))
		
		let interactor = HomeInteractor(repo: mockRepo, pagination: pagination)
		
		do {
			let results = try interactor.filterUsers(nameToSearch: "")
				.toBlocking()
				.single()
			XCTAssertTrue(results.count == 0)
		} catch {
			XCTFail()
		}
		
		let _ = mockRepo.verify(verificationMode: Once()).filterUsers(nameToSearch: "")
	}
	
	func testRemoveUser() {
		let mockRepo = UserRepositoryMock(testCase: self)
		let pagination = Pagination()
		
		let interactor = HomeInteractor(repo: mockRepo, pagination: pagination)
		
		interactor.removeUser(id: "")
		
		let _ = mockRepo.verify(verificationMode: Once()).removeUser(id: "")
	}
}
