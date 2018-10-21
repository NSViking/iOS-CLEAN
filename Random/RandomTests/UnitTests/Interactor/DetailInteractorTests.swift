//
//  DetailInteractorTests.swift
//  RandomTests
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import XCTest
import Moya
import RxSwift
import RxBlocking
import Mockit

@testable import Random

class DetailInteractorTests: XCTestCase {
    
    func testGetUserById() {
        let mockRepo = UserRepositoryMock(testCase: self)
        
        let userID = "myUserId"
        let mockResponse: User = User()
        mockResponse.id = userID
        let _ = mockRepo.when()
            .call(withReturnValue: mockRepo.getUserById(id: userID))
            .thenReturn(Single.just(mockResponse))
        
        let interactor = DetailInteractor(repo: mockRepo)
        
        do {
            let _ = try interactor.getUserBy(id: userID)
                .toBlocking()
                .single()
        } catch {
            XCTFail()
        }
        
        let _ = mockRepo.verify(verificationMode: Once()).getUserById(id: userID)
    }
}
