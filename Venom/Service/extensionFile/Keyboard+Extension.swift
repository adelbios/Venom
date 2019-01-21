//
//  Keyboard+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

//MARK: - notificationCenter
extension NotificationCenter {
    
    class func keyboardWillShow(_ observ : Any,selector : Selector){
        self.default.addObserver(observ, selector: selector, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    class func keyboardWillHide(_ observ : Any, selector : Selector){
        self.default.addObserver(observ, selector: selector, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    class func endObservation(_ observ : Any){
        self.default.removeObserver(observ)
    }
}

//MARK: - this param we needed to detrmain keyboard frame , show & hide animation duration
extension Notification {
    
    var keyboardFrame : CGRect? {
        return (self.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
    var keyboardDuration : TimeInterval? {
        return self.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    }
    
}
