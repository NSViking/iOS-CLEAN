//
//  DetailInteractor.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

class DetailInteractor {
    
    let repo: UserRepositoryContract
    
    init(repo: UserRepositoryContract) {
        self.repo = repo
    }
}

extension DetailInteractor: DetailInteractorContract {
    func getUserBy(id: String) -> Single<User> {
        return self.repo.getUserById(id: id)
    }
}
