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
    
    let provider = APIModule.getProvider(baseurl: "http://api.randomuser.me")
    
    func getUsers(url: String) -> Single<[UserData]> {
        
        return provider
			.rx
			.request(.get(results: 4))
			.filterSuccessfulStatusCodes()
            .map(Results.self)
			.map { moyaResponse -> [UserData] in
				return moyaResponse.results
            }.catchError({ error -> Single<[UserData]> in
                return Single.error(HTTPClientError.genericError)
            })
	}
}
