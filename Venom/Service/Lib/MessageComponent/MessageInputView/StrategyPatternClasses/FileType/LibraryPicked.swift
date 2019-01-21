//
//  LibraryPicked.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

struct LibraryPicked : FileOption {
    
    func option(in vc: UIViewController, messageInputView: MessageInputView) {
        
        YPImagePicker.implementImagePicker(screens: [.library], startScreen: .library, maxSelectedItem: 1, rootViewController: vc, completionPhoto: { image in
            
            guard let c =  messageInputView.photoPicked else { return }
            c(image)
            
        }, completionVideo: { (image, url) in
            guard let c =  messageInputView.videoPicked else { return }
            c(image,url)
        })
        
    }
    
}
