//
//  Devices.swift
//  
//
//  Created by Víctor Vicente on 21/10/2018.
//

import Foundation
import Device

class Devices {
    
    static func isIpadOrIpadScreenSize() -> Bool {
        return Device.type() == .iPad ||
            Device.size() == .screen7_9Inch || Device.size() == .screen9_7Inch || Device.size() == .screen10_5Inch || Device.size() == .screen12_9Inch
    }
    
    static func isLandscapeForUpdates() -> Bool {
        if Devices.isIpadOrIpadScreenSize() {
            if UIDevice.current.orientation.isLandscape {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
    static func isDeviceLandscape() -> Bool {
        if Devices.isIpadOrIpadScreenSize() {
            if UIDevice.current.orientation.isLandscape {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
    static func isLandscapeForStart() -> Bool {
        if Devices.isIpadOrIpadScreenSize() {
            if UIApplication.shared.statusBarOrientation.isLandscape {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
}
