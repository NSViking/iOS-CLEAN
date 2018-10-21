//
//  Views.swift
//  Random
//
//  Created by Víctor Vicente on 21/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.identifier(), bundle: nil)
    }
}
