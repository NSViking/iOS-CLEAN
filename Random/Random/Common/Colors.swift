//
//  Colors.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    public class func lightGray(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: alpha)
    }
    
    public class func midnightBlue(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 34.0 / 255.0, green: 40.0 / 255.0, blue: 45.0 / 255.0, alpha: alpha)
    }
    
    public class func banana(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 210.0 / 255.0, blue: 83.0 / 255.0, alpha: alpha)
    }
}
