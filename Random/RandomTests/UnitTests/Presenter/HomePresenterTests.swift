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
    
    var mockRouter: HomeRouterMock!
    var mockView: HomeViewMock!
    var mockInteractor: HomeInteractorMock!
    
    override func setUp() {
        mockRouter = HomeRouterMock(testCase: self)
        mockView = HomeViewMock(testCase: self)
        mockInteractor = HomeInteractorMock(testCase: self)
    }
    
    func testSetupData() {
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView, router: mockRouter)
    
        presenter.setupData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getUsers()
        let _ = mockView.verify(verificationMode: Once()).reloadData()
    }
    
    func testSetupDataWrong() {
        
        let _ = mockInteractor.when()
            .call(withReturnValue: mockInteractor.getUsers())
            .thenReturn(Single.error(HomeInteractorError.generic))
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView, router: mockRouter)
        
        presenter.setupData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getUsers()
        let _ = mockView.verify(verificationMode: Once()).showError()
    }
    
    func testGetMoreData() {
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView, router: mockRouter)
        
        presenter.getMoreData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getMoreUsers()
        let _ = mockView.verify(verificationMode: Once()).reloadData()
    }
    
    func testGetMoreDataWrong() {
        
        let _ = mockInteractor.when()
            .call(withReturnValue: mockInteractor.getMoreUsers())
            .thenReturn(Single.error(HomeInteractorError.generic))
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView, router: mockRouter)
        
        presenter.getMoreData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getMoreUsers()
        let _ = mockView.verify(verificationMode: Once()).showError()
    }
    
    func testGoToDetail() {
        
        let presenter = HomePresenter(interactor: mockInteractor, view: mockView, router: mockRouter)
        presenter.dataSource = [UserViewModel()]
        
        presenter.goToDetail(index: 0)
        
        let _ = mockRouter.verify(verificationMode: Once()).goToUserDetail(userId: "")
    }
}
