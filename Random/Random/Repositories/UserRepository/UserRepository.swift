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
    var dataBaseClient: DataBaseClientContract
	
	init(httpClient: HTTPClientContract, dataBaseClient: DataBaseClientContract) {
		self.httpClient = httpClient
        self.dataBaseClient = dataBaseClient
	}
}

extension UserRepository: UserRepositoryContract {
    func hasUsers() -> Bool {
        return self.dataBaseClient.hasUsers()
    }
    
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
        return self.dataBaseClient
            .getUserBy(id: id)
            .map { userDataBase -> User in
            return UserMapper.mapUserDataBaseToUser(userDataBase: userDataBase)
        }
    }
    
    func saveUsers(users: [User]) {
        let usersDataBase = users.map { user -> UserDataBase in
            return UserMapper.mapUserToUserDataBase(user: user)
        }
        self.dataBaseClient.saveUsers(users: usersDataBase)
    }
    
    func getUsers() -> Single<[User]> {
        return self.dataBaseClient
            .getUsers()
            .map { userDataBaseArray -> [User] in
                return userDataBaseArray.map { userDataBase -> User in
                    return UserMapper.mapUserDataBaseToUser(userDataBase: userDataBase)
                }
            }.catchError { error -> Single<[User]> in
                return Single.error(UserRepositoryError.mapping)
        }
    }
    
    func removeUser(id: String) {
        self.dataBaseClient.removeUser(id: id)
    }
	
	func filterUsers(nameToSearch: String) -> Single<[User]>  {
		return self.dataBaseClient.getUsersContains(data: nameToSearch)
			.map { userDataBaseArray -> [User] in
				return userDataBaseArray.map { userDataBase -> User in
					return UserMapper.mapUserDataBaseToUser(userDataBase: userDataBase)
				}
			}.catchError { error -> Single<[User]> in
				return Single.error(UserRepositoryError.mapping)
		}
	}
}
