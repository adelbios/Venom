//
//  SignUpForm+Layout.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension SignUpForm {
    
    func setupUI(){
        add(self.containerView)
        self.containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.height.equalTo(self).multipliedBy(0.9)
        }
        
        
        self.containerView.add(self.logoImageView)
        self.logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).inset(8)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.height.equalTo(150)
        }
        
     
        self.containerView.add(self.firstNameTxt)
        self.firstNameTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self).inset(15)
            $0.top.equalTo(self.logoImageView.snp.bottom).inset(-25)
            $0.height.equalTo(50)
        }
        
        
        self.containerView.add(self.lastNameTxt)
        self.lastNameTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.firstNameTxt)
            $0.top.equalTo(self.firstNameTxt.snp.bottom).inset(-10)
            $0.height.equalTo(firstNameTxt.snp.height)
        }
        
        
        self.containerView.add(self.emailText)
        self.emailText.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.lastNameTxt)
            $0.top.equalTo(self.lastNameTxt.snp.bottom).inset(-10)
            $0.height.equalTo(self.lastNameTxt.snp.height)
        }
        
        
        self.containerView.add(self.userNameTxt)
        self.userNameTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.emailText)
            $0.top.equalTo(self.emailText.snp.bottom).inset(-10)
            $0.height.equalTo(emailText.snp.height)
        }
        
        self.containerView.add(self.passwordTxt)
        self.passwordTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.userNameTxt)
            $0.top.equalTo(self.userNameTxt.snp.bottom).inset(-10)
            $0.height.equalTo(self.userNameTxt.snp.height)
        }
        
        self.containerView.add(self.confirmPasswordTxt)
        self.confirmPasswordTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.passwordTxt)
            $0.top.equalTo(self.passwordTxt.snp.bottom).inset(-10)
            $0.height.equalTo(self.passwordTxt.snp.height)
        }
        
        
        self.containerView.add(self.cityText)
        self.cityText.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.confirmPasswordTxt)
            $0.top.equalTo(self.confirmPasswordTxt.snp.bottom).inset(-10)
            $0.height.equalTo(self.confirmPasswordTxt.snp.height)
        }
       
        self.add(self.createAccountBtn)
        self.createAccountBtn.snp.makeConstraints {
            $0.top.equalTo(self.cityText.snp.bottom).inset(-40)
            $0.width.equalTo(170)
            $0.height.equalTo(40)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        
    }
    

    private func topSpaceing()->CGFloat{
        var space:CGFloat = 0.0
        UIDevice().detect { d in
            if d == .iphoneSmall{
                space =  -30.0
            }else{
                space =  -80.0
            }
        }
        
        return space
    }
    
}
