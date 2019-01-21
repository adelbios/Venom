//
//  SenderButtonType.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 12/31/18.
//  Copyright © 2018 adel radwan. All rights reserved.
//

import UIKit

protocol SenderButton {
    func buttonOptionWith(MessageTxt:String,and sendButton:UIButton)
}

struct SendButtonType {
    
    let type : SenderButton
    func buttonOption(MessageTxt:String,and sendButton:UIButton){
        self.type.buttonOptionWith(MessageTxt:MessageTxt,and:sendButton)
    }
}


class SendButton : SenderButton {
    
    func buttonOptionWith(MessageTxt: String, and sendButton: UIButton) {
    //TODO enhance animation for performance onse
        let icon =  VenomConfiguration.config.messageInputView.icon
        sendButton.setImage(icon.sendMessageIcon, for: .normal)
        if MessageTxt.count == 1 {
            sendButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                sendButton.transform = .identity
            })//end animation
            
        }//end if
        
    }
    
}


class MicrophoneButton : SenderButton {
    
    func buttonOptionWith(MessageTxt: String, and sendButton: UIButton) {
        let icon =  VenomConfiguration.config.messageInputView.icon
        sendButton.setImage(icon.microphoneIcon, for: .normal)
        if MessageTxt.count == 0 {
            sendButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                sendButton.transform = .identity
            })//end animation
        }
    }
}
