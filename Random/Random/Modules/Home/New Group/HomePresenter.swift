//
//  HomePresenter.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class HomePresenter {
    var interactor: HomeInteractorContract
    
    init(interactor: HomeInteractorContract) {
        self.interactor = interactor
    }
}

