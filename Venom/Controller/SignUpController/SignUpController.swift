//
//  SignUpController.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SideMenuController
import JGProgressHUD

class SignUpController: ScrollController {
    
   
    
    lazy var signUpView:SignUpForm = {
        let v = SignUpForm()
        v.rootViewController = self
        v.didSelectCloseBtn  = { self.dismiss() }
        v.didCreatAccountBtn = { self.createUser() }
        return v
    }()
    
    
    override func viewDidLoad() {
        self.scrolViewContentSize = 700
        self.scrolViewTopInset    = 20
        self.scrolViewBottomInset = 20
        super.viewDidLoad()
        self.contollerSettings()
 
    }
    
    
    func createUser() {
        let form = self.signUpView
        guard let email  = form.emailText.text,
            let pass     = form.passwordTxt.text,
            let fName    = form.firstNameTxt.text,
            let lName    = form.lastNameTxt.text,
            let userName = form.userNameTxt.text,
            let country  = form.cityText.text else {
            return
        }
        
        FirebaseService.shared.createAuthUser(email: email, password: pass, firstName: fName,lastName: lName,userName:userName,country: country, in: self) {
            
            guard let id = ConstantData.userId else { return }
            
            FirebaseService.shared.getUserInfo(userId: id, completion: {
                self.login(.title).setSession(val: self.login(.title))
                self.present(ConstantData.sideMenuVC())
            })
            
        }
        
    }
    
    
}



