//
//  SignInForm+Layout.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension SignInForm {
    
    private var containerViewCutAway:CGFloat {
        return 80.0
    }
   
    func setupUI(){
        
        add(self.containerView)
        self.containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.height.equalTo(self).multipliedBy(0.9)
        }
        
        self.containerViewMaskLayer.fillColor = UIColor.black.cgColor
        self.containerView.layer.mask = self.containerViewMaskLayer
        
        self.containerView.add(self.logoImageView)
        self.logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).inset(8)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.height.equalTo(150)
        }
        
        
        self.containerView.add(self.emailText)
        self.emailText.snp.makeConstraints {
            $0.leading.trailing.equalTo(self).inset(15)
            $0.top.equalTo(self.logoImageView.snp.bottom).inset(-15)
            $0.height.equalTo(50)
        }
        
        self.containerView.add(self.passwordTxt)
        self.passwordTxt.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.emailText)
            $0.top.equalTo(self.emailText.snp.bottom).inset(-15)
            $0.height.equalTo(self.emailText.snp.height)
        }
        
        self.containerView.add(self.forgotPassBtn)
        self.forgotPassBtn.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.passwordTxt)
            $0.top.equalTo(self.passwordTxt.snp.bottom).inset(-2)
            $0.height.lessThanOrEqualTo(100)
        }
    
        
        self.containerView.add(self.loginBtn)
        self.loginBtn.snp.makeConstraints {
            $0.top.equalTo(self.forgotPassBtn.snp.bottom).inset(-40)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
            $0.centerX.equalTo(self.containerView.snp.centerX)
        }
        
        self.add(self.signUpButton)
        self.signUpButton.snp.makeConstraints {
            $0.top.equalTo(self.containerView.snp.bottom).inset(47)
            $0.trailing.equalTo(self.snp.trailing).inset(25)
            $0.width.height.equalTo(70)
        }
        
        self.add(self.createAccountTitleBbutton)
        self.createAccountTitleBbutton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(12)
            $0.leading.equalTo(self.snp.leading).inset(12)
            $0.width.lessThanOrEqualTo(150)
            $0.height.lessThanOrEqualTo(100)
        }
        
    }
    
    
    private func updateHeader(){
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: containerView.frame.width, y: 0))
        path.addLine(to: CGPoint(x: containerView.frame.width, y: containerView.frame.height))
        path.addLine(to: CGPoint(x: 0, y: containerView.frame.height-self.containerViewCutAway))
        self.containerViewMaskLayer.path = path.cgPath
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateHeader()
    }
    
    
}
