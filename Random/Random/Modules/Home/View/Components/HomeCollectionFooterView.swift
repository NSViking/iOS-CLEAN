//
//  HomeCollectionFooterView.swift
//  Random
//
//  Created by VITI on 23/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

let kFooterViewTag = 1989

class HomeCollectionFooterView: UICollectionReusableView {
    let loading = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension HomeCollectionFooterView {
    
    func setupUI() {
        self.addSubview(loading)
        setupLoading()
        setupAutolayout()
    }
    
    func setupLoading() {
        loading.style = .gray
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.tintColor = UIColor.gray
        loading.tag = kFooterViewTag
    }
    
    func setupAutolayout() {
        self.loading.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
