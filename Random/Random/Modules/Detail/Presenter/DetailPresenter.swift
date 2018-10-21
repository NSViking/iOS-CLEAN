//
//  DetailPresenter.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

class DetailPresenter {
    
    var interactor: DetailInteractorContract
    weak var view: DetailViewContract?
    var userId: String
    
    //RxSwift
    let disposeBag = DisposeBag()
    
    init(view: DetailViewContract, interactor: DetailInteractorContract, userId: String) {
        self.view = view
        self.interactor = interactor
        self.userId = userId
    }
}

extension DetailPresenter: DetailPresenterContract {
    func setupData() {
        
        _ = self.interactor.getUserBy(id: userId)
            .subscribe(onSuccess: { user in
                self.view?.renderUserInfo(userDetail: UserMapper.mapUserToUserDetailViewModel(user: user))
            }) { error in
                self.view?.showError()
            }.disposed(by: disposeBag)
    }
}
