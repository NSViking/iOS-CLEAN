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
        setupContainerViewProperties()
        setupUserImageViewProperties()
        setupUserNameLabelProperties()
        setupEmailLabelProperties()
        setupPhoneButtonProperties()
        setupRemoveButtonProperties()
    }
    
    func setupSubViews() {
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(phoneButton)
        self.contentView.addSubview(removeButton)
    }
}

private extension HomeCollectionViewCell {
    func setupAutoLayout() {
        containerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(15)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(120)
            maker.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        
        emailLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
        
        phoneButton.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(35)
            maker.right.equalToSuperview().offset(-35)
            maker.height.equalTo(45)
            maker.top.equalTo(emailLabel.snp.bottom).offset(15)
        }
        
        removeButton.snp.makeConstraints { maker in
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalToSuperview().offset(15)
            maker.height.equalTo(50)
            maker.width.equalTo(50)
        }
    }
    
    func setupViewProperties() {
        backgroundColor = UIColor.clear
    }
    
    func setupContainerViewProperties() {
        self.containerView.layer.cornerRadius = 15
        self.containerView.clipsToBounds = true
        self.containerView.backgroundColor = UIColor.lightGray()
    }
    
    func setupUserImageViewProperties() {
        userImageView.contentMode = .scaleAspectFit
        userImageView.backgroundColor = UIColor.midnightBlue()
        userImageView.layer.borderColor = UIColor.banana().cgColor
        userImageView.layer.borderWidth = 2
        userImageView.layer.cornerRadius = 60
        userImageView.clipsToBounds = true
    }
    
    func setupUserNameLabelProperties() {
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
    }
    
    func setupEmailLabelProperties() {
        emailLabel.numberOfLines = 2
        emailLabel.font = UIFont.italicSystemFont(ofSize: 18)
        emailLabel.textColor = UIColor.black
        emailLabel.textAlignment = .center
    }
    
    func setupPhoneButtonProperties() {
        phoneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func setupRemoveButtonProperties() {
        self.removeButton.setImage(UIImage(named: "remove.png"), for: .normal)
        self.removeButton.addTarget(self, action: #selector(removeButtonDidPress), for: .touchUpInside)
    }
}
