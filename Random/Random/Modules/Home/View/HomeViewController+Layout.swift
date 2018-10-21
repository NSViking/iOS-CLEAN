//
//  HomeViewController+Layout.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension HomeViewController {
    func setupUI() {
        setupTitle()
        setupSubviews()
        setupViewProperties()
        setupCollectionViewProperties()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
         self.view.addSubview(collectionView)
    }
    
    private func setupTitle() {
        self.title = "Users"
    }
    
    private func setupViewProperties() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionViewProperties() {
        collectionView.contentInset = UIEdgeInsets(top: 25, left: 25 * 0.5, bottom: 0, right: 25 * 0.5)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier())
        DispatchQueue.main.async {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    }
    
    private func setupFlowLayoutProperties() {
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
    
    func setupAutoLayout() {
        
        self.collectionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
