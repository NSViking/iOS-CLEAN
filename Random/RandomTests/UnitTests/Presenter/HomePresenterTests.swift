//
//  HomePresenterTests.swift
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

class HomePresenterTests: XCTestCase {
    
    func testSetupData() {
        
        let mockView = HomeViewMock(testCase: self)
        let mockInteractor = HomeInteractorMock(testCase: self)
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView)
    
        presenter.setupData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getUsers()
        let _ = mockView.verify(verificationMode: Once()).reloadData()
    }
    
    func testSetupDataWrong() {
        
        let mockView = HomeViewMock(testCase: self)
        let mockInteractor = HomeInteractorMock(testCase: self)
        
        let _ = mockInteractor.when()
            .call(withReturnValue: mockInteractor.getUsers())
            .thenReturn(Single.error(HomeInteractorError.generic))
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView)
        
        presenter.setupData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getUsers()
        let _ = mockView.verify(verificationMode: Once()).showError()
    }
    
    func testGetMoreData() {
        
        let mockView = HomeViewMock(testCase: self)
        let mockInteractor = HomeInteractorMock(testCase: self)
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView)
        
        presenter.getMoreData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getMoreUsers()
        let _ = mockView.verify(verificationMode: Once()).reloadData()
    }
    
    func testGetMoreDataWrong() {
        
        let mockView = HomeViewMock(testCase: self)
        let mockInteractor = HomeInteractorMock(testCase: self)
        
        let _ = mockInteractor.when()
            .call(withReturnValue: mockInteractor.getMoreUsers())
            .thenReturn(Single.error(HomeInteractorError.generic))
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView)
        
        presenter.getMoreData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getMoreUsers()
        let _ = mockView.verify(verificationMode: Once()).showError()
    }
}
