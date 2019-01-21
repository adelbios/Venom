//
//  CAGradientLayer.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/19/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 1, y: 0)
        endPoint = CGPoint(x: 0, y: 0)
    }
    
    convenience init(frameWithoutLoaction: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frameWithoutLoaction
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
