//
//  HTTPClientContract.swift
//  Random
//
//  Created by Víctor Vicente on 20/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

protocol HTTPClientContract {
    func getUsers(url: String) -> Single<[UserData]>
}

enum HTTPClientError: Swift.Error, CustomStringConvertible {
	var description: String { return "HTTPClientError.." }
	case noContentError
	case noConnectionError
	case genericError
}
