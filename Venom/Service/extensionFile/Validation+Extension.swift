//
//  Validation+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import SwiftValidator
import SkyFloatingLabelTextField

extension Validator {
    
    
    func form(_ form : SkyFloatingLabelTextField,roule : [Rule]){
        
        self.registerField(textField: form, errorLabel: form.titleLabel, rules: roule)
    }
    
    
    func validationStyle(){
        
        self.styleTransformers(success:{ (validationRule) -> Void in
            validationRule.errorLabel?.isHidden = false
            validationRule.errorLabel?.text = ""
            if let textField = validationRule.textField as? SkyFloatingLabelTextField {
                textField.errorMessage = nil
            }
        }, error:{ (validationError) -> Void in
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
            if let textField = validationError.textField as? SkyFloatingLabelTextField {
                textField.errorMessage = validationError.errorMessage
            }
        })
        
    }
    
    
    
    func normalValidationStyle(_ completion :@escaping(_ textField : UITextField,_ errorLabel:UILabel)->Void){
        
        self.styleTransformers(success:{ (validationRule) -> Void in
            // clear error label
            let textField = validationRule.textField
            
            validationRule.errorLabel?.textColor = .black
            textField.layer.borderColor          = UIColor.black.cgColor
            textField.layer.borderWidth          = 1
            completion(textField,validationRule.errorLabel!)
            
        }, error:{ (validationError) -> Void in
            print("error")
            //            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
            validationError.errorLabel?.textColor = .red
            let textField = validationError.textField
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            
        })
        
    }
    
    
    func validationFailed(){
        
        for (_, error) in errors {
            
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
            
        }
    }
    
    func realTimeValidation(textField: UITextField){
        self.validateField(textField: textField) { error in
            if error == nil {
                // Field validation was successful
            } else {
                // Validation error occurred
            }
        }
        
    }
    
}
