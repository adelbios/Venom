//
//  UITableView+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/19/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    func load(_ cellClass:AnyClass){
        self.tableFooterView = UIView()
        self.register(cellClass.self, forCellReuseIdentifier: cellClass.description())
    }
    
}


extension NSObject {
    
    class var name : String {
        return self.description()
    }
    
    
    func register(_ title : ControllerString.Register)->String{
        return title.rawValue
    }
    
    func login(_ title : ControllerString.Login)->String{
        return title.rawValue
    }
    
    func validation(_ title : ControllerString.Validation)->String{
        return title.rawValue
    }
    
    func update(_ title : ControllerString.Update)->String{
        return title.rawValue
    }
    
    
    func history(_ title : ControllerString.History)->String{
        return title.rawValue
    }
    
    
    
    
 
}

