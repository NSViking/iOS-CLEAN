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
		user.name = userData.name?.firstName ?? ""
		user.lastname = userData.name?.lastName ?? ""
		user.gender = userData.gender
		user.city = userData.location?.city ?? ""
		user.phone = userData.phone
		user.picture = userData.picture?.medium ?? ""
		user.registeredDate = userData.registered?.date ?? ""
		user.street = userData.location?.street ?? ""
		user.state = userData.location?.state ?? ""
		
		return user
	}
}
