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
        let dataBaseClient = DataBaseClient()
        let repo = UserRepository(httpClient: client, dataBaseClient: dataBaseClient)
        let pagination = Pagination()
        
        let router = HomeRouter(view: viewController)
        
        let interactor = HomeInteractor(repo: repo, pagination: pagination)
        let presenter = HomePresenter(interactor: interactor, view: viewController, router: router)
        
        viewController.presenter = presenter
    }
}
