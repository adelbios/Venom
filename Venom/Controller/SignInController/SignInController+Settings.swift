//
//  SignInController+Layout.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - this extnsion for controller settings
extension SignInController {
    
   private func setupUI(){
        self.add(self.signInView)
        self.signInView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view)
        }
    }
    
    
    func controllerSettings(){
        self.setupUI()
        self.navigationController?.navigationBar.barTintColor = .appDarkGreen
        self.navigationItem.title = self.login(.title)
        self.empteyBackButtonItem()
    }

    
}
