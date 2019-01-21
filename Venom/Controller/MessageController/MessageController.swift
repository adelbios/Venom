//
//  SendNewMessageController.swift
//  Venom
//
//  Created by Adel Radwan on 1/4/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

class MessageController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.empteyBackButtonItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(sendNewMessage))
        
    }
    
    
    
    @objc private func sendNewMessage(){
        
        self.pushTo(SelectUserToChatVC())
    }
    
}
