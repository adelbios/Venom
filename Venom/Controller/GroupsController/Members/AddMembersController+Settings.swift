//
//  AddMembersController+Settings.swift
//  Venom
//
//  Created by Adel Radwan on 1/7/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit


extension AddMembersController {
    
    func controllerSettings(){
        view.backgroundColor = .secondColor
        self.tableView.load(SelectUserToChat.self)
        self.tableView.separatorColor = .black
        self.tableView.separatorInset.left = 80
        self.navigationItem.title = "New Group".capitalized
        self.empteyBackButtonItem()
    }
    
}
