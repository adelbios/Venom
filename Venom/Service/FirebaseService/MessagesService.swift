//
//  MessagesService.swift
//  Venom
//
//  Created by Adel Radwan on 1/4/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MessagesService {
    
    
    private var messegeRefrence : DatabaseReference? {
        return Database.database().reference().child(Messages.messageKey.rawValue)
    }
    
    private var userMessegeRefrence : DatabaseReference? {
        return Database.database().reference().child(Messages.userMessageKey.rawValue)
    }
    
    var groupRefrence : DatabaseReference? {
        return Database.database().reference().child(Messages.group.rawValue)
    }
    
    
    
    func sendNewMessage(txt : String = "",imageUrl : String = "",imageWidth: CGFloat = 0.0,imageHeight: CGFloat = 0.0, toId : String,videoUrl : String = "", completion :@escaping()->Void){
        
        let ref    =  self.messegeRefrence?.child(ConstantData.userId!).child(toId).childByAutoId()
        let refTo  =  self.messegeRefrence?.child(toId).child(ConstantData.userId!).childByAutoId()
        let value : [String : Any] = [Messages.text.rawValue       : txt,
                                      Messages.image.rawValue      : imageUrl,
                                      Messages.imageWidth.rawValue : imageWidth,
                                      Messages.imageHeight.rawValue: imageHeight,
                                      Messages.video.rawValue      : videoUrl,
                                      Messages.timeStamp.rawValue  : Int(Date().timeIntervalSince1970),
                                      Messages.fromId.rawValue     : ConstantData.userId!,
                                      Messages.toId.rawValue       : toId]
        
        
        ref?.setValue(value)
        refTo?.setValue(value, withCompletionBlock: { (error, r) in
            
            if let e = error {
                print(e.localizedDescription)
            }else{
                completion()
                
            }
            
        })// end setValue
        
    }
    
    
    func createGroup(name : String,users:[String], completion :@escaping()->Void){
        
        let ref     =  self.groupRefrence?.childByAutoId()
        let group   =  ref?.child(name).child(Messages.member.rawValue)
        
        group?.setValue(users, withCompletionBlock: { (error, r) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
        })
        
        let groupId = ref!.key
        let value : [String:Any] = [Messages.groupId.rawValue:groupId!]
        users.forEach { userId in
            
            FirebaseService.shared.userRefrence?.child(userId)
                .child(Messages.group.rawValue)
                .child(groupId!)
                .updateChildValues(value, withCompletionBlock: { (error, ref) in
                    if let e = error {
                        print(e.localizedDescription)
                        return
                    }
                    completion()
                })
        }
    }
    
    
    func getUsetGroups(_ completion :@escaping(_ dictionary:[String:AnyObject])->Void){
        
        FirebaseService.shared.userRefrence?
            .child(ConstantData.userId!)
            .child(Messages.group.rawValue)
            .observe(.value, with: { snapshot in
            guard let data = snapshot.value as? [String : AnyObject] else { return }
            
                guard let result = snapshot.children.allObjects as? [DataSnapshot] else { return }
                
                result.forEach({ child in
                    print(child.key)
                })
                
                completion(data)
                
                
    
        })
    
    
    }
    
    
    
    func loadMessageWith(toUserId:String,completion :@escaping (_ dictionary:[String:AnyObject],_ meesageId:String)->Void){
        
        let ref = messegeRefrence?.child(ConstantData.userId!).child(toUserId)
        ref?.observe(.childAdded, with: { snapshot in
            guard let dic = snapshot.value as? [String:AnyObject] else { return }
            completion(dic,snapshot.key)
        })
    }
    
    
    func loadMessage(completion :@escaping (_ data : [String : AnyObject],_ meesageId:String,_ fromId:String,_ toId:String,_ username:String)->Void){
        
        let ref  = messegeRefrence?.child(ConstantData.userId!)
        
        ref?.observe(.childAdded, with: { (snapshot) in
            
            let toUserId = snapshot.key
            
            
            FirebaseService.shared.getUserInfo(userId: toUserId, completion: { userInfo in
                
                
                self.messegeRefrence?.child(ConstantData.userId!).child(toUserId).queryLimited(toLast: 1).observe(.childAdded, with: { s in
                    
                    
                    guard let dic = s.value as? [String : AnyObject] else { return }
                    let userName = userInfo.bind(User.firstName) + " " + userInfo.bind(User.lastName)
                    
                    completion(dic,s.key,ConstantData.userId!,toUserId,userName)
                })
                
                
            })
            
            
        })// end Main observe  for get all message for loged in user
    }
    
    
}
