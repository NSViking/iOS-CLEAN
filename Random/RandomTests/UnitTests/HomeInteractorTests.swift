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
	
	func testGetUsers() {
        let mockRepo = UserRepositoryMock(testCase: self)
        let pagination = Pagination()
        
        let mockResponse: [User] = []
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers(pagination: pagination))
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
	}
    
    func testGetMoreUsers() {
        let mockRepo = UserRepositoryMock(testCase: self)
        let pagination = Pagination()
        
        let mockResponse: [User] = []
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUsers(pagination: pagination))
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
    }
}
