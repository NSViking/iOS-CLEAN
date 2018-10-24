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
    
    let mainScrollView = UIScrollView()
    
    var presenter: DetailPresenterContract?
    
    override func viewDidLoad() {
        setupUI()
        setupData()
    }
    
    func setupData() {
        self.presenter?.setupData()
    }
    
    func addAnotation(longitude: Double, latitude: Double) {
        let annotation = MKPointAnnotation()
        var coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        if !CLLocationCoordinate2DIsValid(coordinate) {
            coordinate = CLLocationCoordinate2D(latitude: 41.383349, longitude: 2.139448)
        }
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
        
        self.centerMapToPin(coordinate: coordinate)
    }
    
    func centerMapToPin(coordinate: CLLocationCoordinate2D) {
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
}

extension DetailViewController: DetailViewContract {

    func renderUserInfo(userDetail: UserDetailViewModel) {
        
        self.title = userDetail.username
        
        self.usernameLabel.text = userDetail.username
        self.emailLabel.text = userDetail.email
        self.locationLabel.text = userDetail.location
        self.genderImageView.image = userDetail.gender == Gender.female.rawValue ? UIImage(named: "femenine") : UIImage(named: "masculine")
        
        self.registeredDateLabel.text = convertDateFormater(userDetail.registeredDate)
        
        if let url = URL(string: userDetail.picture) {
            userImageView.af_setImage(withURL: url, imageTransition: .crossDissolve(0.2))
        }
        
        guard let longitude = Double(userDetail.longitude), let latitude = Double(userDetail.latitude) else {
            return
        }
        
        self.addAnotation(longitude: longitude, latitude: latitude)
    }
    
    func showError() {
        
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)
        
    }
}
