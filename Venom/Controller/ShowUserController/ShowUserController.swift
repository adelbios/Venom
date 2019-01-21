//
//  ShowUserControllerViewController.swift
//  Venom
//
//  Created by Adel Radwan on 1/4/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

class ShowUserControllerViewController: UIViewController {
    
    
    var userData : UsersModel! {
        didSet{
            print(userData.email)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
