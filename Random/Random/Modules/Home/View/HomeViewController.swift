//
//  HomeViewController.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    lazy var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
    
    var presenter: HomePresenterContract?
    
    override func viewDidLoad() {
        self.setupUI()
        self.setupAutoLayout()
    }
}

extension HomeViewController: HomeViewContract {
    
    func showError() {
        
    }
    
    func reloadData() {
        
    }
}
