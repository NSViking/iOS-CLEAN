//
//  HomeCollectionViewCell.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import AlamofireImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    var containerView = UIView()
    var userImageView = UIImageView()
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneButton = RoundedButton()
    var removeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
    }
    
    func configure(userName: String, phone: String, email: String, picture: String) {
        
        nameLabel.text = userName
        phoneButton.setTitle(phone, for: .normal)
        emailLabel.text = email
        
        if let url = URL(string: picture) {
            userImageView.af_setImage(withURL: url, imageTransition: .crossDissolve(0.2))
        }
    }
}
