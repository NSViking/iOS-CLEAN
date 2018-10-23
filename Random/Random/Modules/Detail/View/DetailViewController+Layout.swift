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
        setupScrollViewProperties()
        setupContainerViewProperties()
        setupUserImageViewProperties()
        setupUserNameLabelProperties()
        setupEmailLabelProperties()
        setupLocationLabelProperties()
        setupMapProperties()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
        self.view.addSubview(mainScrollView)
        
        mainScrollView.addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(genderImageView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(registeredDateLabel)
        containerView.addSubview(emailLabel)
        containerView.addSubview(map)
    }
    
    private func setupViewProperties() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupScrollViewProperties() {
        self.mainScrollView.contentInsetAdjustmentBehavior = .never
        self.mainScrollView.backgroundColor = UIColor.white
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
        mainScrollView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { maker in
            maker.width.equalTo(mainScrollView.snp.width)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(40)
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
            maker.top.equalTo(userImageView.snp.bottom).offset(8).priority(500)
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
        }
        
        emailLabel.snp.makeConstraints { maker in
            maker.top.equalTo(usernameLabel.snp.bottom).offset(8).priority(500)
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().offset(-15)
        }
        
        registeredDateLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(15).priority(500)
            maker.right.equalToSuperview().offset(-15)
        }
        
        map.snp.makeConstraints { maker in
            maker.top.equalTo(emailLabel.snp.bottom).offset(15).priority(500)
            maker.left.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
            maker.height.equalTo(200)
        }
        
        locationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(map.snp.bottom).offset(15)
            maker.left.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
            maker.bottom.equalTo(containerView.snp.bottom).offset(-40).priority(100)
        }
    }
}
