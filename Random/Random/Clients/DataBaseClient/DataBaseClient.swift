//
//  DataBaseClient.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class DataBaseClient: DataBaseClientContract {
    
    func getUsers() -> Single<[UserDataBase]> {
        let realm = try! Realm()
        
        let predicate = NSPredicate(format: "deleted == %d", 0)
        let users = realm.objects(UserDataBase.self).filter(predicate)
        return Single.just(Array(users))
    }
    
    func getUserBy(id: String) -> Single<UserDataBase> {
        let realm = try! Realm()
        
        let predicate = NSPredicate(format: "idUser == %@", id)
        guard let user = realm.objects(UserDataBase.self).filter(predicate).first else {
            return Single.error(DataBaseClientError.notFound)
        }
        
        return Single.just(user)
    }
    
    func saveUsers(users: [UserDataBase]) {
        let realm = try! Realm()
        
        try! realm.write {
            for userK in users {
                
                let predicate = NSPredicate(format: "idUser == %@", "\(userK.idUser)")
                if realm.objects(UserDataBase.self).filter(predicate).first != nil {
                    return
                }
                realm.add(userK)
            }
        }
    }
    
    func hasUsers() -> Bool {
        let realm = try! Realm()
        
        let count = realm.objects(UserDataBase.self).count
        return count > 0
    }
}
