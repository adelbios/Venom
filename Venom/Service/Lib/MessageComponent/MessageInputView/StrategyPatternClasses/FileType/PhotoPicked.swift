//
//  PhotoPicked.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

struct PhotoPicked:FileOption {
    
    func option(in vc: UIViewController, messageInputView: MessageInputView) {
        
        YPImagePicker.implementImagePicker(screens: [.photo], startScreen: .photo, maxSelectedItem: 1, rootViewController: vc, completionPhoto: { image in
            
            guard let c =  messageInputView.photoPicked else { return }
            c(image)
        })
        
    }
    
}
