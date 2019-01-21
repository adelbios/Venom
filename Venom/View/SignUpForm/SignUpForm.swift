//
//  SignUpForm.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ActionKit
import SwiftValidator

class SignUpForm: BaseView,UITextFieldDelegate {
    
    let validator          = Validator()
    var isValidationError  = false
    var borderView         = UIView()
    var didCreatAccountBtn : (()->())?
    var didSelectCloseBtn  : (()->())?
    var rootViewController:UIViewController!
    
    
    var containerView : UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .clear
        return v
    }()
    
    
    var logoImageView:UIImageView = {
        let i = UIImageView(image: UIImage(named: "logo"))
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    
    lazy var firstNameTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.register(.regFName),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.tag = 1
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    lazy var lastNameTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.register(.regLName),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.tag = 2
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    
    lazy var emailText : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        
        s.customize(placeholder:self.register(.regEmail),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    keyboardType: .emailAddress,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.delegate = self
        s.tag = 3
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    lazy var userNameTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.register(.regUserName),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.tag = 4
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    lazy var passwordTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.register(.regPassword),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.isSecureTextEntry = true
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    
    lazy var confirmPasswordTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.register(.regConfirmPassword),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.isSecureTextEntry = true
        s.tag = 6
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    
    
    lazy var cityText : PickerFloadingTextField = {
        let t = PickerFloadingTextField(placeholder: self.register(.regCountry))
        t.pickerType = {
            self.endEditing(true)
            t.showCityPicker(title: self.register(.picker).uppercased(), viewController: self.rootViewController)
        }
        t.validation = { self.validator.realTimeValidation(textField: t) }
        return t
    }()
    
    lazy var createAccountBtn : UIButton = {
        let b = UIButton(type: .system)
        b.titleLabel?.font = .theSanse(type: .plain, size: 17)
        b.setTitle(self.register(.button).uppercased(), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius  = 5
        b.layer.masksToBounds = true
        b.layer.borderColor   = UIColor.white.cgColor
        b.layer.borderWidth   = 1
        b.addControlEvent(.touchUpInside, {
            self.validator.validate(delegate: self)
        })
        return b
    }()
    
    override func setupLayout() {
        self.setupUI()
        self.setupFormValidation()
        self.backgroundColor = .appGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
