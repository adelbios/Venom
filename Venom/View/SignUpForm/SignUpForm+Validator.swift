//
//  SignUpForm+Validator.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SwiftValidator
import SkyFloatingLabelTextField

extension SignUpForm : ValidationDelegate {
    
    func validationSuccessful() {
        guard let s = self.didCreatAccountBtn else { return }
        s()
    }
    
    func validationFailed(errors: [UITextField : ValidationError]) {
        self.validator.validationFailed()
    }

    func setupFormValidation() {
        self.validator.validationStyle()
        
        let reqRule     = RequiredRule(self.validation(.required))
        let emailRule   = EmailRule(self.validation(.email))
        let confirmRule = ConfirmationRule(confirmField: self.passwordTxt,self.validation(.confirm))
        
        self.validator.form(self.firstNameTxt,       roule: [reqRule])
        self.validator.form(self.lastNameTxt,        roule: [reqRule])
        self.validator.form(self.emailText,          roule: [reqRule,emailRule])
        self.validator.form(self.userNameTxt,        roule: [reqRule])
        self.validator.form(self.passwordTxt,        roule: [reqRule])
        self.validator.form(self.confirmPasswordTxt, roule: [reqRule,confirmRule])
        self.validator.form(self.cityText,           roule: [reqRule])
        
    }
    
    
    @objc func textFieldDidChange(_ textField:UITextField){
        
        switch textField.tag {
        case 1:
           self.realTimeValidation(self.firstNameTxt,
                                   successName: self.register(.fName),
                                   errorName: self.register(.regFName))
        case 2:
            
            self.realTimeValidation(self.lastNameTxt,
                                    successName: self.register(.lName),
                                    errorName: self.register(.regLName))
        case 3:
            
            self.realTimeValidation(self.emailText,
                                    successName: self.register(.email),
                                    errorName: self.register(.regEmail))
            
            self.userNameTxt.text = self.emailText.text?.components(separatedBy: "@")[0]
            
            self.realTimeValidation(self.userNameTxt,
                                    successName: self.register(.userName),
                                    errorName: self.register(.regUserName))
            
            
        case 4:
            self.realTimeValidation(self.userNameTxt,
                                    successName: self.register(.userName),
                                    errorName: self.register(.regUserName))
        case 5:
            self.realTimeValidation(self.passwordTxt,
                                    successName: self.register(.password),
                                    errorName: self.register(.regPassword))
        case 6:
            
            self.realTimeValidation(self.confirmPasswordTxt,
                                    successName: self.register(.confirmPassword),
                                    errorName: self.register(.regConfirmPassword))
            
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
