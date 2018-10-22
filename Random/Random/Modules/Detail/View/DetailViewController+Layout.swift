//
//  DetailViewController+Layout.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
    
    func setupUI() {
        setupSubviews()
        setupViewProperties()
        setupContainerViewProperties()
        setupUserImageViewProperties()
        setupUserNameLabelProperties()
        setupEmailLabelProperties()
        setupLocationLabelProperties()
        setupMapProperties()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
        self.view.addSubview(containerView)
        self.view.addSubview(userImageView)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(genderImageView)
        self.view.addSubview(locationLabel)
        self.view.addSubview(registeredDateLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(map)
    }
    
    private func setupViewProperties() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupContainerViewProperties() {
        self.containerView.layer.cornerRadius = 30
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
        usernameLabel.numberOfLines = 0
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        usernameLabel.textColor = UIColor.black
        usernameLabel.textAlignment = .center
    }
    
    func setupEmailLabelProperties() {
        emailLabel.numberOfLines = 0
        emailLabel.font = UIFont.italicSystemFont(ofSize: 18)
        emailLabel.textColor = UIColor.black
        emailLabel.textAlignment = .center
    }
    
    func setupLocationLabelProperties() {
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont.boldSystemFont(ofSize: 18)
        locationLabel.textColor = UIColor.black
        locationLabel.textAlignment = .left
    }
    
    func setupMapProperties() {
        map.layer.cornerRadius = 15
    }
    
    func setupAutoLayout() {
        containerView.snp.makeConstraints { maker in
            maker.left.equalTo(15)
            maker.right.equalTo(-15)
            maker.top.equalToSuperview().offset(160)
            maker.bottom.equalTo(-15)
        }
        
        userImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(180)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(120)
            maker.height.equalTo(120)
        }
        
        genderImageView.snp.makeConstraints { maker in
            maker.centerY.equalTo(userImageView.snp.centerY)
            maker.right.equalTo(userImageView.snp.left).offset(-8)
            maker.height.equalTo(30)
            maker.width.equalTo(30)
        }
        
        usernameLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        
        emailLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalTo(usernameLabel.snp.bottom).offset(8)
        }
        
        registeredDateLabel.snp.makeConstraints { maker in
            maker.right.equalToSuperview().offset(-15)
            maker.top.equalToSuperview().offset(15)
        }
        
        map.snp.makeConstraints { maker in
            maker.top.equalTo(emailLabel.snp.bottom).offset(15)
            maker.left.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
            maker.height.equalTo(200)
        }
        
        locationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(map.snp.bottom).offset(15)
            maker.left.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
        }
    }
}
