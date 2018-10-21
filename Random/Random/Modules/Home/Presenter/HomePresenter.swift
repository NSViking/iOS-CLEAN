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
    weak var view: HomeViewContract?
    
    var dataSource: [User] = []
    
    init(interactor: HomeInteractorContract, view: HomeViewContract) {
        self.interactor = interactor
        self.view = view
    }
}

extension HomePresenter: HomePresenterContract {
    
    func setupData() {
        _ = self.interactor.getUsers()
            .subscribe(onSuccess: { usersDataSource in
                self.dataSource = usersDataSource
                self.view?.reloadData()
        }) { error in
            self.view?.showError()
        }
    }
    
    func getMoreData() {
        _ = self.interactor.getMoreUsers()
            .subscribe(onSuccess: { usersDataSource in
                self.dataSource.append(contentsOf: usersDataSource)
                self.view?.reloadData()
        }) { error in
            self.view?.showError()
        }
    }
    
    func getDataSource() -> [User] {
        return self.dataSource
    }
}
