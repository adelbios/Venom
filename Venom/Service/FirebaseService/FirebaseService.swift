//
//  FirebaseService.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/19/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import JGProgressHUD
import CoreLocation

class FirebaseService {
    
    private init(){}
    
    static let shared = FirebaseService()
    
    let messages = MessagesService()
    
     var userRefrence : DatabaseReference? {
        return Database.database().reference().child(User.key.rawValue)
    }
    
    
    private let loading = JGProgressHUD(style: .extraLight)
    
    private func createUserWith(_ id: String,email: String,firstName : String,lastName:String,location:CLLocationCoordinate2D,in vc:UIViewController,completion:@escaping()->Void){
        
        let lat = "\(location.latitude)"
        let long = "\(location.longitude)"
        let loc  = "\(lat),\(long)"
        
        let ref  = userRefrence?.child(id)
        let value = [User.email.rawValue     : email,
                     User.firstName.rawValue : firstName,
                     User.lastName.rawValue  : lastName,
                     User.location.rawValue  : loc] 
        
        ref?.setValue(value, withCompletionBlock: { (error, r) in
            
            if let e = error {
                self.loading.dismiss(animated: true)
                vc.handleError(e)
                return
            }
                completion()
            
        })
    }
    
    
     func getUserInfo(userId : String,completion:@escaping()->Void){
        userRefrence?.child(userId).observe(.value, with: { snapshot in
            guard let dic = snapshot.value as? [String : AnyObject] else { return }
            let userModel = UserModel(userData: dic)
            RealmService.shared.create(userModel)
            self.loading.dismiss(animated: true)
            completion()
        })
    }
    
    func getUserInfo(userId : String,completion :@escaping (_ userData : [String : AnyObject])->Void){
        
        self.userRefrence?.child(userId).observe(.value, with: { snapshot in
            guard let dic = snapshot.value as? [String : AnyObject] else { return }
            completion(dic)
        })
    }
    

    
    func createAuthUser(email:String,password:String,firstName:String,lastName:String,location:CLLocationCoordinate2D,in vc : UIViewController,completion:@escaping()->Void){
        self.loading.show(in: vc.view, animated: true)
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, error) in
            
            if let error = error {
                self.loading.dismiss(animated: true)
                vc.handleError(error)
                return
            }
            
            guard let uid = res?.user.uid else { return }
            
            self.createUserWith(uid, email: email, firstName: firstName, lastName: lastName, location: location, in: vc, completion: {
                completion()
            })
        }
        
    }
    
    
    func login(email:String,password:String,in vc : UIViewController ,completion:@escaping()->Void){
        self.loading.show(in: vc.view, animated: true)
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if let error = error {
                self.loading.dismiss(animated: true)
                vc.handleError(error)
                return
            }
            completion()
        })
    }
    
    
    
    func fetchUser(in vc:UIViewController,dataCount:Int,_ completion :@escaping(_ dictionary :[String : AnyObject],_ userID:String)->Void){
        if dataCount == 0 {
            self.loading.show(in: vc.view, animated: true)
        }
        
        userRefrence?.observe(.value, with: { snapshot in
            guard let result = snapshot.children.allObjects as? [DataSnapshot] else { return }
                for child in result {
                     let orderID = child.key as String //get autoID

                    self.userRefrence?.child(orderID).observe(.value, with: { s in
                        guard let dic = s.value as? [String : AnyObject] else { return }
                        self.loading.dismiss()
                        completion(dic, orderID)
                    })
  
                }
        })
    }
    
    
    
    func updateUserProfile(firstName:String,lastName:String,location:CLLocationCoordinate2D,vc:UIViewController){
        self.loading.show(in: vc.view, animated: true)
        
        
            let lat = "\(location.latitude)"
            let long = "\(location.longitude)"
            let loc  = "\(lat),\(long)"
            
            let value = [User.firstName.rawValue : firstName,
                         User.lastName.rawValue  : lastName,
                         User.location.rawValue  : loc]
            
            
            self.userRefrence?.child(ConstantData.userId!).updateChildValues(value, withCompletionBlock: { (e, r) in
                if let error = e {
                    self.loading.dismiss(animated: true)
                    vc.handleError(error)
                    return
                }
                
                self.loading.dismiss()
            })
    }

}
