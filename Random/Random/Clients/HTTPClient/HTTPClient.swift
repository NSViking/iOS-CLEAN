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
    
    func getUsers(url: String) -> Single<Response> {
		
		let provider = APIModule.getProvider(baseurl: "")
		
		return provider
			.rx
			.request(.get(results: 4))
			.filterSuccessfulStatusCodes()
			.map { moyaResponse -> Response in
				if (moyaResponse.statusCode == 204) {
					// No content
					throw HTTPClientError.noContentError
				}
				else {
					return moyaResponse
				}
			}
	}
}
