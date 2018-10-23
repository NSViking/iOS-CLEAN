//
//  UserMapper.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class UserMapper {
	class func mapUserDataToUser(userData: UserData) -> User {
		let user = User()
        //Sometimes the id is null so we customize our ID as (ID + Name)
        let keyID = (userData.id?.name ?? "") + (userData.id?.value ?? "")
        let keyName = (userData.name?.first ?? "") + (userData.name?.last ?? "")
        user.id = keyID + keyName
		user.name = userData.name?.first ?? ""
		user.lastname = userData.name?.last ?? ""
        user.email = userData.email
		user.gender = userData.gender
        user.city = userData.location?.city ?? ""
        user.phone = userData.phone
        user.picture = userData.picture?.medium ?? ""
        user.registeredDate = userData.registered?.date ?? ""
        user.street = userData.location?.street ?? ""
        user.state = userData.location?.state ?? ""
        user.longitude = userData.location?.coordinates?.longitude ?? "0"
        user.latitude = userData.location?.coordinates?.latitude ?? "0"
		
		return user
	}
    
    class func mapUserToUserViewModel(user: User) -> UserViewModel {
        let userViewModel = UserViewModel()
        userViewModel.userId = user.id
        userViewModel.username = user.name.capitalized + " " + user.lastname.capitalized
        userViewModel.email = user.email
        userViewModel.phone = user.phone
        userViewModel.picture = user.picture
        
        return userViewModel
    }
    
    class func mapUserToUserDetailViewModel(user: User) -> UserDetailViewModel {
        let userViewModel = UserDetailViewModel()
        userViewModel.username = user.name.capitalized + " " + user.lastname.capitalized
        userViewModel.email = user.email
        userViewModel.phone = user.phone
        userViewModel.gender = user.gender
        userViewModel.picture = user.picture
        userViewModel.location = user.street.capitalized + ",\n" + user.city.capitalized + ",\n" + user.state.capitalized
        userViewModel.registeredDate = user.registeredDate
        userViewModel.longitude = user.longitude
        userViewModel.latitude = user.latitude
        
        return userViewModel
    }
    
    class func mapUserDataBaseToUser(userDataBase: UserDataBase) -> User  {
        let user = User()
        
        user.city = userDataBase.location?.city ?? ""
        user.email = userDataBase.email
        user.gender = userDataBase.gender
        user.id = userDataBase.idUser
        user.lastname = userDataBase.lastname
        user.name = userDataBase.firstname
        user.phone = userDataBase.phone
        user.picture = userDataBase.picture
        user.registeredDate = userDataBase.registered
        user.state = userDataBase.location?.state ?? ""
        user.street = userDataBase.location?.street ?? ""
        user.latitude = userDataBase.location?.latitude ?? "0"
        user.longitude = userDataBase.location?.longitude ?? "0"
        
        return user
    }
    
    class func mapUserToUserDataBase(user: User) -> UserDataBase  {
        let userDataBase = UserDataBase()
        
        userDataBase.email = user.email
        userDataBase.gender = user.gender
        userDataBase.idUser = user.id
        userDataBase.lastname = user.lastname
        userDataBase.firstname = user.name
        userDataBase.phone = user.phone
        userDataBase.picture = user.picture
        userDataBase.registered = user.registeredDate
        
        let location = LocationDataBase()
        location.city = user.city
        location.state = user.state
        location.street = user.street
        location.latitude = user.latitude
        location.longitude = user.longitude
        
        userDataBase.location = location
        
        return userDataBase
    }
}
