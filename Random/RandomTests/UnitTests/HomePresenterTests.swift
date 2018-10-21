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
        
        let mockInteractor = HomeInteractor
        
        let presenter = HomePresenter(interactor: <#HomeInteractorContract#>)
    }
}
