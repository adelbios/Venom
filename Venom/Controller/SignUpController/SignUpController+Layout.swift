//
//  File.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - this extnsion for controller settings
extension SignUpController {
    
    private func setupUI(){
        self.scrollView.backgroundColor = .appGray
        self.holderView.add(self.signUpView)
        self.signUpView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(self.holderView)
        }
    }
    
    
    func contollerSettings(){
        
        self.setupUI()
        self.navigationItem.title = self.register(.title).uppercased()
        self.navigationController?.navigationBar.barTintColor = .appGray
        
    }

}
