//
//  MaterialTextField+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import SkyFloatingLabelTextField

extension SkyFloatingLabelTextField  {

    func customize(placeholder:String ,placeholderFontSize : CGFloat ,textFontSize : CGFloat , keyboardType : UIKeyboardType = .default,textColor:UIColor,titleColor:UIColor,errorColor:UIColor = .appRed,alignment:NSTextAlignment = .justified){
        
        self.placeholder         = placeholder
        self.font                = .theSanse(type: .plain, size: textFontSize)
        self.textColor           = textColor
        self.keyboardType        = keyboardType
        self.titleFont           = .theSanse(type: .plain, size: placeholderFontSize)
        self.titleColor          = titleColor
        self.selectedTitleColor  = titleColor
        self.placeholderColor    = titleColor
        self.selectedLineColor   = titleColor
        self.lineColor           = titleColor
        self.errorColor          = errorColor
        self.textAlignment       = alignment
        self.autocorrectionType  = .no
    }

    
}
