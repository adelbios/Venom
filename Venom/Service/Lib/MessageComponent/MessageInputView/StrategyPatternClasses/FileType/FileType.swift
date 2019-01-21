//
//  FileType.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit


protocol FileOption {
    func option(in vc:UIViewController,messageInputView:MessageInputView)
}

struct FileType {

    let type:FileOption
    
    func option(in vc:UIViewController,messageInputView:MessageInputView){
        self.type.option(in: vc, messageInputView: messageInputView)
    }

}

