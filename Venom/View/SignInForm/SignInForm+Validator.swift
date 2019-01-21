//
//  SignInForm+Validator.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SwiftValidator
import SkyFloatingLabelTextField

extension SignInForm : ValidationDelegate {
    func validationSuccessful() {

        guard let s = self.didSelectLoginBtn else { return }
        s()
    }
    
    func validationFailed(errors: [UITextField : ValidationError]) {
        self.validator.validationFailed()
    }
    
    func setupFormValidation() {
        self.validator.validationStyle()
        
        let reqRule     = RequiredRule(self.validation(.required))
        let emailRule   = EmailRule(self.validation(.email))
        
        self.validator.form(self.emailText, roule: [reqRule,emailRule])
        self.validator.form(self.passwordTxt, roule: [reqRule])
    }
    
    
    
    @objc func textFieldDidChange(_ textField:UITextField){
        
        switch textField.tag {
        case 1:
            self.realTimeValidation(self.emailText,
                                    successName: self.login(.email),
                                    errorName: self.login(.loginEmail))
        case 2:
            self.realTimeValidation(self.passwordTxt,
                                    successName: self.login(.password),
                                    errorName: self.login(.loginPass))
        default:
            return
        }
    }
    
    
    private func realTimeValidation(_ textField:SkyFloatingLabelTextField,successName:String,errorName:String){
        
        self.validator.validateField(textField: textField) { error in
            if error == nil {
                textField.placeholder = successName
            }else{
                textField.placeholder = errorName
            }
        }
    }
    
    
}
