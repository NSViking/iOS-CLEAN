//
//  UserRepository.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

class UserRepository {
	
	var httpClient: HTTPClientContract
	
	init(httpClient: HTTPClientContract) {
		self.httpClient = httpClient
	}
}

extension UserRepository: UserRepositoryContract {
	func getUsers(pagination: Pagination) -> Single<[User]> {
		return self.httpClient
			.getUsers(url: "")
			.map { userDataArray -> [User] in
				return userDataArray.map { userData -> User in
					return UserMapper.mapUserDataToUser(userData: userData)
				}
            }.catchError { error -> Single<[User]> in
                return Single.error(UserRepositoryError.generic)
            }
	}
    
    func getUserById(id: String) -> Single<User> {
        //TODO: Connect with persistent client
        return Single.just(User())
    }
}
