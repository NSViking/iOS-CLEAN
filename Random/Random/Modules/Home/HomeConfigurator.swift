//
//  HomeConfigurator.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class HomeConfigurator {
    
    class func createHomeStack() -> HomeViewController {
        
        let homeVC = HomeViewController()
        configure(homeVC)
        
        return homeVC
    }
}

extension HomeConfigurator {
    
    class func configure(_ viewController: HomeViewController) {
        
        let client = HTTPClient()
        let repo = UserRepository(httpClient: client)
        let pagination = Pagination()
        let interactor = HomeInteractor(repo: repo, pagination: pagination)
        let presenter = HomePresenter(interactor: interactor, view: viewController)
        
        viewController.presenter = presenter
    }
}
