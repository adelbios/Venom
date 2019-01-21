//
//  Controller+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import SideMenuController

extension UIViewController {
    
    func add(_ view: UIView){
        self.view.addSubview(view)
    }
    
    func pushTo(_ viewController : UIViewController){
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(_ viewController : UIViewController){
        self.present(viewController, animated: true, completion: nil)
    }

    func dismiss(_ completion:@escaping()-> Void = {}){
        self.dismiss(animated: true, completion: completion)
    }

    func popToRoot(completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.navigationController?.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func popToMasterRoot(completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.navigationController?.popToRootViewController(animated: true)
        CATransaction.commit()
    }
    
    
    func isIphoneXLayout()->Bool{
        print(UIScreen.main.bounds.height)
        if UIScreen.main.bounds.height > 740.0 {
            return true
        }else{
            return false
        }
    }
    
    //MARK: - FixLayout
    func fixLayout(){
        self.edgesForExtendedLayout = UIRectEdge()
        self.extendedLayoutIncludesOpaqueBars = false
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    
    
    //MARK: - navigationBar
    func empteyBackButtonItem(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func backButtonItemTitle(_ title : String? = "back"){
        if let t = title{
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: t, style: .plain, target: nil, action: nil)
        }
    }
  
    
    func addSideMenu(){
        self.navigationController?.addSideMenuButton()
    }
    
}
