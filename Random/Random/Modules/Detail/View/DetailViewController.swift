//
//  DetailViewController.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import AlamofireImage
import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var containerView = UIView()
    var usernameLabel = UILabel()
    var genderImageView = UIImageView()
    var locationLabel = UILabel()
    var registeredDateLabel = UILabel()
    var emailLabel = UILabel()
    var userImageView = UIImageView()
    var map = MKMapView()
    
    var presenter: DetailPresenterContract?
    
    override func viewDidLoad() {
        setupUI()
    }
}

extension DetailViewController: DetailViewContract {

    func renderUserInfo(userDetail: UserDetailViewModel) {
        
        self.usernameLabel.text = userDetail.username
        self.emailLabel.text = userDetail.email
        self.locationLabel.text = userDetail.location
        self.registeredDateLabel.text = userDetail.registeredDate
        self.genderImageView.image = userDetail.gender == "female" ? UIImage(named: "masculine") : UIImage(named: "femenine")
        
        if let url = URL(string: userDetail.picture) {
            userImageView.af_setImage(withURL: url, imageTransition: .crossDissolve(0.2))
        }
    }
    
    func showError() {
        
    }
}
