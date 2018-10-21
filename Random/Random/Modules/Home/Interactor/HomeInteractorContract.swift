//
//  HomeInteractorContract.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeInteractorContract {
	func getUsers() -> Single<[User]>
    func getMoreUsers() -> Single<[User]>
}
