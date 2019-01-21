//
//  SignInForm+ResetPass.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/22/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import FirebaseAuth
extension SignInForm {
    
    
    func handleForgotPassword(){
    
        let forgotPasswordAlert = UIAlertController(title: self.login(.forgotPassword), message: self.login(.loginEmail), preferredStyle: .alert)
        
        forgotPasswordAlert.addTextField { (textField) in
            textField.placeholder = self.login(.loginEmail)
        }
        forgotPasswordAlert.addAction(UIAlertAction(title: self.login(.cancel), style: .cancel, handler: nil))
        forgotPasswordAlert.addAction(UIAlertAction(title: self.login(.resetPass), style: .default, handler: { (action) in
            let resetEmail = forgotPasswordAlert.textFields?.first?.text
            Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
                if error != nil{
                    let resetFailedAlert = UIAlertController(title: self.login(.resetFailed), message: "\(self.login(.error)) \(String(describing: error!.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: self.login(.okay), style: .default, handler: nil))
                    DispatchQueue.main.async {
                        self.rootViewController?.present(resetFailedAlert)
                    }
                }else {
                    let resetEmailSentAlert = UIAlertController(title: self.login(.resetsuccess), message: self.login(.checkEmail), preferredStyle: .alert)
                    resetEmailSentAlert.addAction(UIAlertAction(title: self.login(.okay), style: .default, handler: nil))
                    DispatchQueue.main.async {
                        self.rootViewController?.present(resetEmailSentAlert)
                    }
                }
            })
        }))
        //PRESENT ALERT
        DispatchQueue.main.async {
            self.rootViewController?.present(forgotPasswordAlert)
        }
    }
    
}
