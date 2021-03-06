//
//  HomeViewController.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    lazy var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
    
    var presenter: HomePresenterContract?
	
	var searchMode = false
    
    override func viewDidLoad() {
        self.setupUI()
        self.setupData()
    }
    
    func setupData() {
        self.presenter?.setupData()
    }
	
	@objc func resetSearch() {
		self.searchMode = false
		self.setupData()
		self.removeResetButton()
	}
}

extension HomeViewController: HomeViewContract {
    
    func showError() {
        
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
		
		if let text = searchController.searchBar.text, text.count > 0 {
			searchMode = true
			self.setupResetButton()
			guard let textToSearch = searchController.searchBar.text, textToSearch != "" else {
				self.setupData()
				return
			}
			self.presenter?.filterUsers(nameToSearch: textToSearch)
		}
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = self.presenter?.getDataSourceCount() else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier(), for: indexPath)
            as? HomeCollectionViewCell else {
                return UICollectionViewCell()
        }

        guard let userViewModel = self.presenter?.getDataAt(index: indexPath.row) else {
            return cell
        }
        cell.configure(userName: userViewModel.username, phone: userViewModel.phone, email: userViewModel.email, picture: userViewModel.picture, id: userViewModel.userId)
        cell.delegate = self
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.goToDetail(index: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColumns: Int!
        if Devices.isIpadOrIpadScreenSize() {
            numberOfColumns = Devices.isDeviceLandscape() || Devices.isLandscapeForStart() ? 4 : 3
        } else {
            numberOfColumns = 1
        }

        let insets = collectionView.contentInset.left + collectionView.contentInset.right
        let width = (collectionView.frame.width - insets) / CGFloat(numberOfColumns)
        return CGSize(width: width, height: 300.0)
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width:(collectionView.frame.size.width), height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeCollectionFooterView.identifier(), for: indexPath) as? HomeCollectionFooterView else {
                    return UICollectionReusableView()
            }
            return view
        }
        return UICollectionReusableView()
    }
    
	func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
		if elementKind == UICollectionView.elementKindSectionFooter {
			
			guard let footerView = view as? HomeCollectionFooterView,
				let dataSourceCount = self.presenter?.getDataSourceCount(),
				dataSourceCount > 0,
				searchMode == false else {
					return
			}
			
			footerView.loading.startAnimating()
			self.presenter?.getMoreData()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
		if elementKind == UICollectionView.elementKindSectionFooter {
			
			let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: HomeCollectionFooterView.identifier(), for: indexPath) as? HomeCollectionFooterView
			
			footerView?.loading.stopAnimating()
			footerView?.loading.removeFromSuperview()
		}
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func removeButtonDidPress(id: String) {
        self.presenter?.removeUser(id: id)
        self.presenter?.setupData()
        self.reloadData()
    }
    
    func phoneButtonAction(phone: String) {
        self.presentAlertToCall(phone: phone)
    }
    
    func presentAlertToCall(phone: String) {
        let cancelButtonTitle = "Cancel"
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel)
        
        let callButtonTitle = "Call"
        let callAction = UIAlertAction(title: callButtonTitle, style: .default) { _ in
            if let url = URL(string: "tel://\(phone)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let callAlertController = UIAlertController(
            title: nil,
            message: "Do you want call to \(phone)",
            preferredStyle: .alert)
        callAlertController.addAction(cancelAction)
        callAlertController.addAction(callAction)
        self.present(callAlertController, animated: true)
    }
}
