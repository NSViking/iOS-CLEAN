//
//  HTTPClient.swift
//  Random
//
//  Created by Víctor Vicente on 20/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class HTTPClient: HTTPClientContract {
    
    func getUsers(url: String) -> Single<[UserData]> {
		
		let provider = APIModule.getProvider(baseurl: "")
		
		return provider
			.rx
			.request(.get(results: 4))
			.filterSuccessfulStatusCodes()
			.map(UserData.self)
			.map { moyaResponse -> [UserData] in
				return [moyaResponse]
			}
	}
}
