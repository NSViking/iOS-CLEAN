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
        map.centerCoordinate = annotation.coordinate
        
        self.centerMapToPin(annotation: annotation)
    }
    
    func centerMapToPin(annotation: MKPointAnnotation) {
        let zoomRect = MKMapRect.null
        let annotationPoint: MKMapPoint = MKMapPoint(annotation.coordinate);
        let pointRect = MKMapRect(origin: annotationPoint, size: MKMapSize(width: 1000.0, height: 1000.0))
        map.visibleMapRect = zoomRect.union(pointRect)
    }
}

extension DetailViewController: DetailViewContract {

    func renderUserInfo(userDetail: UserDetailViewModel) {
        
        self.title = userDetail.username
        
        self.usernameLabel.text = userDetail.username
        self.emailLabel.text = userDetail.email
        self.locationLabel.text = userDetail.location
        self.registeredDateLabel.text = userDetail.registeredDate
        self.genderImageView.image = userDetail.gender == Gender.female.rawValue ? UIImage(named: "femenine") : UIImage(named: "masculine")
        
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
}
