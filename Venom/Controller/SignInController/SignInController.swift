//
//  SignInController.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SideMenuController

class SignInController: UIViewController {
    
    lazy var signInView:SignInForm = {
        let v = SignInForm()
        v.rootViewController = self
        v.didSelectSignUpBtn = {
            DispatchQueue.main.async {
//                self.present()
                self.pushTo(SignUpController())
            }
        }
        v.didSelectLoginBtn = { self.handleLogin() }
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controllerSettings()
    }
    

    func handleLogin(){
        let form = self.signInView
        guard let email = form.emailText.text,let pass = form.passwordTxt.text else {
            return
        }
        FirebaseService.shared.login(email: email, password: pass, in: self) {
            
            guard let id = ConstantData.userId else { return }
            
            FirebaseService.shared.getUserInfo(userId: id, completion: {
                self.login(.title).setSession(val: self.login(.title))
                self.present(ConstantData.sideMenuVC())
            })
            
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .appDarkGreen
    }
    
    
    
}
