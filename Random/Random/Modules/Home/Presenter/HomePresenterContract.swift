//
//  HomePresenterContract.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

protocol HomePresenterContract {
    func setupData()
    func getMoreData()
    
    func getDataSource() -> [UserViewModel]
    func getDataSourceCount() -> Int
    func getDataAt(index: Int) -> UserViewModel
    
    func goToDetail(index: Int)
}
