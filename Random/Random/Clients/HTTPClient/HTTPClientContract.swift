//
//  HTTPClientContract.swift
//  Random
//
//  Created by Víctor Vicente on 20/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol HTTPClientContract {
    func getUsers(url: String) -> Single<Response>
}

enum HTTPClientError: Swift.Error, CustomStringConvertible {
	var description: String { return "MomentsServiceClientError.." }
	case noContentError
	case noConnectionError
	case genericError
}
