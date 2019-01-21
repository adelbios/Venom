//
//  SignInForm.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ActionKit
import SwiftValidator

class SignInForm: BaseView  {
    
    
    var containerViewMaskLayer = CAShapeLayer()
    let validator  = Validator()
    
    var rootViewController:UIViewController?
    var borderView = UIView()
    var didSelectLoginBtn : (()->())?
    var didSelectSignUpBtn : (()->())?
    
    
    var containerView : UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .appDarkGreen
        return v
    }()
    
    var logoImageView:UIImageView = {
        let i = UIImageView(image: UIImage(named: "logo"))
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    
    lazy var emailText : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.login(.loginEmail),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.tag = 1
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    lazy var passwordTxt : SkyFloatingLabelTextField = {
        let s = SkyFloatingLabelTextField()
        s.customize(placeholder:self.login(.loginPass),
                    placeholderFontSize : 14 ,
                    textFontSize : 15 ,
                    textColor:.white,
                    titleColor:UIColor.white.alpha(0.6))
        s.isSecureTextEntry = true
        s.tag = 2
        s.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return s
    }()
    
    
    lazy var forgotPassBtn : UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.appGray, for: .normal)
        l.contentHorizontalAlignment = .left
        l.setTitle(self.login(.forgotPassword), for: .normal)
        l.titleLabel?.font = .theSanse(type: .plain, size: 13)
        l.contentHorizontalAlignment = .right
        l.addControlEvent(.touchUpInside, {
            self.handleForgotPassword()
        })
        return l
    }()
    
    
    lazy var loginBtn : UIButton = {
        let b = UIButton(type: .system)
        b.titleLabel?.font = .theSanse(type: .plain, size: 17)
        b.setTitle("login".uppercased(), for: .normal)
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
    
    
    lazy var createAccountTitleBbutton : UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.appDarkGreen, for: .normal)
        l.contentHorizontalAlignment = .left
        l.setTitle(self.login(.createAccount), for: .normal)
        l.titleLabel?.font = .theSanse(type: .plain, size: 13)
        l.addControlEvent(.touchUpInside, {
            guard let s = self.didSelectSignUpBtn else { return }
            s()
        })
        return l
    }()
    
    lazy var signUpButton : UIButton = {
        let b = UIButton(type: .system)
        b.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        b.tintColor = .white
        b.imageView?.contentMode = .scaleAspectFit
        b.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        b.backgroundColor = .appGray
        b.layer.cornerRadius = 35
        b.layer.masksToBounds = true
        b.addControlEvent(.touchUpInside, {
            guard let s = self.didSelectSignUpBtn else { return }
            s()
        })
        return b
    }()
    
    
    override func setupLayout() {
        self.setupUI()
        self.setupFormValidation()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    
}
