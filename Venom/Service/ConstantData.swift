//
//  ConstantData.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import FirebaseAuth
import SideMenuController

public struct ConstantData {
    
    
    
    static var isUserLogedIn : Bool {
        if "Login".getSession(def: "-1") != "-1" {
            return true
        }else{
            return false
        }
    }
    
    
    static var userId : String? {
        return Auth.auth().currentUser?.uid
    }
    
    
    static func sideMenuVC()->SideMenuController {
        let sideMenuViewController = SideMenuController()
        sideMenuViewController.embed(sideViewController: MenuController())
        sideMenuViewController.embed(centerViewController: UINavigationController(rootViewController: HomeController()))
        
        return sideMenuViewController
    }
    
    
    static func showSuccessAlert(in vc : UIViewController){
        
        let alert = UIAlertController(title: nil, message: "photo saved successfully", preferredStyle: .alert)
        alert.setMessage(font: .theSanse(type: .plain, size: 15), color: .appGray)
        alert.addAction(title: "موافق", color: .appGray, style: .cancel, isEnabled: true, handler: nil)
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    

    
}
