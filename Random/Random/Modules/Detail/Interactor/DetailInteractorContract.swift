//
//  DetailInteractorContract.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailInteractorContract {
    func getUserBy(id: String) -> Single<User>
}
