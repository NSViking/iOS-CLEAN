//
//  HomeCollectionViewCell+Layout.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

extension HomeCollectionViewCell {
    func setupUI() {
        setupSubViews()
        setupAutoLayout()
        setupViewProperties()
        setupUserImageViewProperties()
        setupUserNameLabelProperties()
        setupEmailLabelProperties()
        setupPhoneLabelProperties()
    }
    
    func setupSubViews() {
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(phoneLabel)
    }
    
    private func setupAutoLayout() {
        userImageView.snp.makeConstraints { maker in
            
        }
        
        nameLabel.snp.makeConstraints { maker in
            
        }
        
        emailLabel.snp.makeConstraints { maker in
        
        }
        
        phoneLabel.snp.makeConstraints { maker in
            
        }
    }
    
    private func setupViewProperties() {
        backgroundColor = UIColor.lightGray
    }
    
    private func setupUserImageViewProperties() {
        userImageView.contentMode = .scaleAspectFill
        userImageView.backgroundColor = UIColor.lightGray
        userImageView.layer.borderColor = UIColor.gray.cgColor
        userImageView.layer.cornerRadius = userImageView.bounds.size.width/2
        userImageView.layer.masksToBounds = true
    }
    
    private func setupUserNameLabelProperties() {
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor.black
    }
    
    private func setupEmailLabelProperties() {
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor.black
    }
    
    private func setupPhoneLabelProperties() {
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor.black
    }
}
