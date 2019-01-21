//
//  AddMembersController.swift
//  Venom
//
//  Created by Adel Radwan on 1/7/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit
import RealmSwift


class AddMembersController: UITableViewController {
    
    var userData : Results<UsersModel> = {
        return RealmService.shared.realm.objects(UsersModel.self).filter("id != '\(ConstantData.userId!)'")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controllerSettings()
    
    }
    

}
