//
//  SendMessageController.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/2/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import RealmSwift

class SendMessageController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    private let config = VenomConfiguration.config.messageConsoleView
    
    var fromId = ConstantData.userId!
    var toId   = ""
    
    private var realmFilter : String {
        return "chatOwner = '\(toId)'"
    }
    
    lazy var messageData : Results<MessageModel> = {
        return RealmService.shared.realm.objects(MessageModel.self).filter(self.realmFilter)
    }()
    
    var notificationToken : NotificationToken?
    
    lazy var inputToolbar: MessageInputView = {
        let v = MessageInputView()
        v.rootViewController       = self
        v.isAttachmentButtonHidden = false
        v.isMicrophoneButtonHidden = false
        v.didSelectSendButton = {
            if let text = v.messageTxt.text {
                let messageText =  text.trimmingCharacters(in: .whitespacesAndNewlines)
                self.sendMessage(message: messageText)
                v.messageTxt.text = ""
                v.textViewDidChange(v.messageTxt)
            }
        }
        v.photoPicked = {
            self.sendMessage(photo: $0)
        }
        v.videoPicked = {
            self.sendMessage(thumbImage: $0, videoURL: $1)
        }
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controllerSettings()
        self.loadMessage()
        
        self.notificationToken = RealmService.shared.bind {
            self.collectionView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = true
        RealmService.shared.removeObserv(in: self)
        self.notificationToken?.invalidate()
    }
    
    override var inputAccessoryView: UIView?{
        return self.inputToolbar
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    
    func loadMessage(){}
    func sendMessage(message:String){}
    func sendMessage(photo:UIImage){}
    func sendMessage(thumbImage:UIImage,videoURL : URL){}
    
}

//MARK: - this extension For setup controller Settings
extension SendMessageController {
    
    private func controllerSettings(){
        
        self.collectionView?.contentInset          = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        self.collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 70, left: 0, bottom: 30, right: 0)
        self.collectionView?.backgroundColor       = config.color.backgroundColor
        self.collectionView?.keyboardDismissMode   = .interactive
        self.collectionView?.alwaysBounceVertical  = true
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView?.register(VenomMessageCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let data = self.messageData[indexPath.row]
        
        if data.text == "" {
            return imageSizing(data)
        }else {
            return textMessageSizing(data)
        }
        
    }
    
    
    
    private func textMessageSizing(_ data: MessageModel) -> CGSize {
        let height = self.estematedMessageHeight(text: data.text).height + 30
        return CGSize(width: view.frame.width, height: height)
    }
    
    
    fileprivate func imageSizing(_ data: MessageModel)->CGSize {
        var height : CGFloat = 0.0
        
        let imageHeight = data.imageHeight //CGFloat(data.imageHeight)
        let imageWidth  = data.imageWidth//CGFloat(data.imageWidth)
        
        height = (data.imageWidth / data.imageHeight * 250)
        if imageHeight == 0.0 || imageWidth == 0.0{
            height = 150
        }else{
            height = ( imageWidth / imageHeight * 250 )
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    
    func estematedMessageHeight(text : String)->CGRect{
        //250 is a constent Value When setup MessageCell bubbleView
        let size = CGSize(width: config.size.bubbleViewWidth, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
}

