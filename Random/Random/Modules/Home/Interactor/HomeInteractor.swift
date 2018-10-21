//
//  HomeInteractor.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor {
	var repo: UserRepositoryContract
    var pagination: Pagination
	
	init(repo: UserRepositoryContract, pagination: Pagination) {
		self.repo = repo
        self.pagination = pagination
	}
}

extension HomeInteractor: HomeInteractorContract {
    func getUsers() -> Single<[User]> {
        return self.repo.getUsers(pagination: self.pagination)
    }
    
    func getMoreUsers() -> Single<[User]> {
        self.pagination.next()
        return self.repo.getUsers(pagination: self.pagination)
    }
}
