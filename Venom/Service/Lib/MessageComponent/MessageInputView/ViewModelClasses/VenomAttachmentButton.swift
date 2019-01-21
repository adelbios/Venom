//
//  VenomAttachmentButton.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

struct VenomAttachmentButton {
    
    
    //TODO complete Attachment
    
    
    weak var messageTxt: UITextView!
    weak var button    : UIButton!
    
    func hideAttachmentButton(){
        self.button.isHidden = true
        self.messageTxt.snp.updateConstraints {
            $0.leading.equalTo(self.button.snp.trailing).inset(30)
        }
    }
    
    
    func showAttachmentOption(in vc : UIViewController,messageInputView:MessageInputView){
        
        var file : FileType!
        self.messageTxt.resignFirstResponder()
        self.messageTxt.endEditing(true)
        
        let word = VenomConfiguration.config.messageInputView.wording
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title:word.attchmentLibrary , style: .default, handler: { _ in

            file = FileType(type:LibraryPicked())
            file.option(in: vc, messageInputView: messageInputView)
        
        }))
        
        alert.addAction(UIAlertAction(title: word.attchmentVideo, style: .default, handler: { _ in
            
            file = FileType(type: VideoPicked())
            file.option(in: vc, messageInputView: messageInputView)
            
        }))
        
        alert.addAction(UIAlertAction(title: word.attchmentPhoto, style: .default, handler: { _ in
            
           file = FileType(type: PhotoPicked())
           file.option(in: vc, messageInputView: messageInputView)
            
        }))
        
        //TODO Implement File picked
        
//        alert.addAction(UIAlertAction(title: "File", style: .default, handler: { _ in
//            let types = ["public.item", "public.folder", "public.directory"]
//            let document = UIDocumentPickerViewController(documentTypes: types, in: UIDocumentPickerMode.import)
//            document.navigationController?.navigationBar.barTintColor = .red
//            vc.present(document, animated: true, completion: nil)
//        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
        
    }
    

    
}
