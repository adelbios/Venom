//
//  SelectUserToChatVC.swift
//  Venom
//
//  Created by Adel Radwan on 1/2/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

class SelectUserToChatVC: UITableViewController {

    var userData  = [UsersModel]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondColor
        self.tableView.load(UITableViewCell.self)
        
        FirebaseService.shared.fetchUser(in: self) { dic in
            let userModel = UsersModel(userData: dic)
            self.userData.append(userModel)
            DispatchQueue.main.async(execute: { [weak self] in
                self?.tableView.reloadData()
            })
            
        }
        
    }
    
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.name, for: indexPath)
        let data = self.userData[indexPath.row]
        
        cell.textLabel?.text = data.firstName + data.lastName
        
        return cell
    }
    

}
