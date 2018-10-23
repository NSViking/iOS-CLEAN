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
    func removeUser(id: String) {
        self.repo.removeUser(id: id)
    }
    
    func getUsers() -> Single<[User]> {
        if self.repo.hasUsers() {
            return getUsersFromDataBase()
        } else {
            return getUsersFromCloud()
        }
    }
    
    func getMoreUsers() -> Single<[User]> {
        self.pagination.next()
        return self.repo.getUsers(pagination: self.pagination)
            .flatMap({self.saveUsersAndRetrieve(users: $0)})
            .catchError { error -> Single<[User]> in
                return Single.error(HomeInteractorError.generic)
        }
    }
}

private extension HomeInteractor {
    
    func getUsersFromCloud() -> Single<[User]> {
        return self.repo.getUsers(pagination: self.pagination)
            .flatMap({self.saveUsersAndRetrieve(users: $0)})
            .catchError { error -> Single<[User]> in
                return Single.error(HomeInteractorError.generic)
        }
    }
    
    func getUsersFromDataBase() -> Single<[User]> {
        return self.repo.getUsers()
    }
    
    func saveUsersAndRetrieve(users: [User]) -> Single<[User]> {
        self.repo.saveUsers(users: users)
        return self.repo.getUsers()
    }
}

