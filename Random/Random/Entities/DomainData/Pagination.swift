//
//  Pagination.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation

class Pagination {
	private var currentPage = 0
	private var objectsPerPage = 5
}

extension Pagination {
	func getCurrentPage() -> Int {
		return self.currentPage
	}
	
	func setCurrentPage(page: Int) {
		self.currentPage = page;
	}
	
	func getObjectsPerPage() -> Int {
		return self.objectsPerPage
	}
	
	func setObjectsPerPage(total: Int) {
		self.objectsPerPage = total;
	}
}
