//
//  HomePresenter.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

class HomePresenter {
    
    var router: HomeRouterContract
    var interactor: HomeInteractorContract
    weak var view: HomeViewContract?
    
    var dataSource: [UserViewModel] = []
    
    //RxSwift
    let disposeBag = DisposeBag()
    
    init(interactor: HomeInteractorContract, view: HomeViewContract, router: HomeRouterContract) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
}

extension HomePresenter: HomePresenterContract {
    
    func setupData() {
        _ = self.interactor.getUsers()
            .subscribe(onSuccess: { usersDataSource in
                self.dataSource = self.mapArrayToViewModel(users: usersDataSource)
                self.view?.reloadData()
        }) { error in
            self.view?.showError()
        }.disposed(by: disposeBag)
    }
    
    func getMoreData() {
        _ = self.interactor.getMoreUsers()
            .subscribe(onSuccess: { usersDataSource in
                self.dataSource.append(contentsOf: self.mapArrayToViewModel(users: usersDataSource))
                self.view?.reloadData()
        }) { error in
            self.view?.showError()
        }.disposed(by: disposeBag)
    }
    
    func getDataSource() -> [UserViewModel] {
        return self.dataSource
    }
    
    func getDataSourceCount() -> Int {
        return self.dataSource.count
    }
    
    func getDataAt(index: Int) -> UserViewModel {
        return self.dataSource[index]
    }
    
    func goToDetail(index: Int) {
        let userModel = self.dataSource[index]
        self.router.goToUserDetail(userId: userModel.userId)
    }
}

private extension HomePresenter {
    func mapArrayToViewModel(users: [User]) -> [UserViewModel] {
        let dataSource = users.map { user -> UserViewModel in
            return UserMapper.mapUserToUserViewModel(user: user)
        }
        return dataSource
    }
}
