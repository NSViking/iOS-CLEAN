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
		
		return user
	}
    
    class func mapUserToUserViewModel(user: User) -> UserViewModel {
        let userViewModel = UserViewModel()
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
        userViewModel.picture = user.picture
        userViewModel.location = user.street.capitalized + " ," + user.city.capitalized + " ," + user.state.capitalized
        userViewModel.registeredDate = user.registeredDate
        
        return userViewModel
    }
}
