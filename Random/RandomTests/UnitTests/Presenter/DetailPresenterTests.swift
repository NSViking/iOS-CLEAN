//
//  DetailPresenterTests.swift
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

class DetailPresenterTests: XCTestCase {
    
    func testSetupData() {
        
        let mockView = DetailViewMock(testCase: self)
        let mockInteractor = DetailInteractorMock(testCase: self)
        let userID = "myUserID"
        
        let presenter = DetailPresenter(view: mockView, interactor: mockInteractor, userId: userID)
        
        presenter.setupData()
        
        let _ = mockInteractor.verify(verificationMode: Once()).getUserBy(id: userID)
        let _ = mockView.verify(verificationMode: Once()).renderUserInfo(userDetail: UserDetailViewModel())
    }
}
