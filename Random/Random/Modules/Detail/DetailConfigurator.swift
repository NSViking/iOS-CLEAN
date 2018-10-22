//
//  DetailConfigurator.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class DetailConfigurator {
    
    class func createDetailStack(userId: String) -> DetailViewController {
        
        let detailVC = DetailViewController()
        configure(detailVC, userId)
        
        return detailVC
    }
}

extension DetailConfigurator {
    
    class func configure(_ viewController: DetailViewController, _ userId: String) {
        
        let client = HTTPClient()
        let dataBaseClient = DataBaseClient()
        let repo = UserRepository(httpClient: client, dataBaseClient: dataBaseClient)
    
        let interactor = DetailInteractor(repo: repo)
        let presenter = DetailPresenter(view: viewController, interactor: interactor,
                                        userId: userId)
        
        viewController.presenter = presenter
    }
}
