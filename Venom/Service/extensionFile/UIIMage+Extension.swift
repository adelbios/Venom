//
//  UIIMage+Extensionn.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension UIImage {
    
    var toData : Data {
        return self.jpegData(compressionQuality: 0.8) ?? Data()
    }
    
    var toDataWithFullQuality : Data {
        return self.jpegData(compressionQuality: 1) ?? Data()
    }
    
}
