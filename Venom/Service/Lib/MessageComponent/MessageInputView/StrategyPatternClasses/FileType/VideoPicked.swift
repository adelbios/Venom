//
//  VideoPicked.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

struct VideoPicked : FileOption{
    
    func option(in vc: UIViewController, messageInputView: MessageInputView) {
        
        YPImagePicker.implementImagePicker(screens: [.video], startScreen: .video, maxSelectedItem: 1, rootViewController: vc, completionVideo: { (image, url) in
            
            guard let c =  messageInputView.videoPicked else { return }
            c(image,url)
            
        })
        
    }
    
    
}
