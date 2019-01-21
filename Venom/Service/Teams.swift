//
//  Teams.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

enum FontType : String {
    case bold  = "Bold"
    case plain = "Plain"
}


extension UIFont {
    static func theSanse(type : FontType,size: CGFloat)-> UIFont{
        return UIFont(name: "TheSans-\(type.rawValue)", size: size)!
    }
}

extension UIColor {
    
    static var appRed : UIColor {
        return UIColor(hexString: "#A24B61")
    }

    static var appDarkGreen : UIColor {
        return UIColor(hexString: "#53C5B9")
    }
    
    static var appGray : UIColor {
        return UIColor(hexString:  "#3C3E52")
    }
    
    
}
