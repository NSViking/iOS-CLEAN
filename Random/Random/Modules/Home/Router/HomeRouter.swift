//
//  HomeRouter.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    
    var viewController: UIViewController
    
    init(view: UIViewController) {
        viewController = view
    }
}

extension HomeRouter: HomeRouterContract {
    
    func goToUserDetail(userId: String) {
        let userDetail = DetailConfigurator.createDetailStack(userId: userId)

        self.viewController.navigationController?.pushViewController(userDetail, animated: true)
    }
}
