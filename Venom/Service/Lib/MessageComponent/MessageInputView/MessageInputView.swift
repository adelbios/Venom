//
//  MessageInputView.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 12/31/18.
//  Copyright © 2018 adel radwan. All rights reserved.
//

import UIKit
import SnapKit

//TODO custm color for ImagePicker

public class BaseView : UIView  {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    func setupLayout(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - MessageInputView class
public class MessageInputView: BaseView , UITextViewDelegate {
    
    //i used weak to avoiding memory leak
    weak var rootViewController:UIViewController?
    
    private let config = VenomConfiguration.config.messageInputView
    
    // this is variable using strategy pattern to determain which button i use
    private var buttonType:SendButtonType!
    //-------------------------------------------------------
    
    
    // this is variable using observable pattern to get text in ViewController
    var messageText : VenomMessageBarBox<String> = VenomMessageBarBox("")
    
    
    //if u want to hide attachment button use this ------------------
    var isAttachmentButtonHidden : Bool = false {
        didSet{
            if self.isAttachmentButtonHidden == true {
                self.venomAttachmentButton.hideAttachmentButton()
            }
        }//end didSet
    }
    
    //and hide Microphone use this----------------------------------
    var isMicrophoneButtonHidden : Bool = false {
        didSet{
            if self.isAttachmentButtonHidden == true {
                self.sendeBtn.setImage(config.icon.sendMessageIcon, for: .normal)
            }
        }
    }
    
    //i use delegate pattern to make user send message  && files-----------
    
    var didSelectSendButton : (()->())?
    var photoPicked:((_ image:UIImage)->Void)?
    var videoPicked: ((_ thumbImage :UIImage,_ videoURL:URL)->Void)?
    //TODO   var filePicked: ((_ url : URL)->Void)?
    
    //END delegate pattern----------------------------------
    
    //i use ViewModel pattern to determin option of message console
    private lazy var messageBarSize : VenomMessageBarSize = {
        let t =  VenomMessageBarSize(mainView: self, messageTxt: self.messageTxt)
        t.maxHeight     = config.size.messageTxtMaxHeight
        t.minHeight     = config.size.messageTxtMinHeight
        t.paddingTop    = config.size.messageTxtPaddingTop
        t.paddingBottom = config.size.messageTxtPaddingBottom
        return t
    }()
    
    //and this is viewModel pattern for attachment button option
    private lazy var venomAttachmentButton : VenomAttachmentButton = {
        return VenomAttachmentButton(messageTxt:self.messageTxt,button:self.attachmentBtn)
    }()
    
    //MARK: - End def helper area ********
    
    
    private lazy var attachmentBtn : UIButton = {
        let b = UIButton(type: .system)
        b.setImage(config.icon.attchmentIcon, for: .normal)
        b.tintColor = config.color.attchmentButtonColor
        b.contentMode = .scaleAspectFit
        b.addTarget(self, action: #selector(sendAttatchment), for: .touchUpInside)
        return b
    }()
    
    
    private lazy var sendeBtn : UIButton = {
        let b = UIButton(type: .system)
        b.setImage(config.icon.microphoneIcon, for: .normal)
        b.tintColor       = config.color.sendButtonColor
        b.contentMode     = .scaleAspectFit
        b.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        return b
    }()
    
    private lazy var placeholderLabel : UILabel = {
        let l        = UILabel()
        l.text      = config.wording.messegePlaceholder.uppercased()
        l.font      = config.font.messegeTxtFont
        l.textColor = config.color.placeholderColor
        return l
    }()
    
     lazy var messageTxt : UITextView = {
        let t = UITextView()
        t.bounces = true
        t.textColor           = config.color.messegTxtColor
        t.layer.cornerRadius  = 17.5
        t.layer.borderColor   = config.color.messageBorderColor.cgColor
        t.layer.borderWidth   = config.size.messageBorderWidth
        t.layer.masksToBounds = true
        t.font                = config.font.messegeTxtFont
        t.contentInset.left   = 8
        t.contentInset.right  = 8
        t.enablesReturnKeyAutomatically = true
        t.delegate = self
        return t
    }()
    
    
    override func setupLayout() {
        
        //for holderViewBacground
        self.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0)
        autoresizingMask     = [.flexibleHeight]
        self.setupUI()
        
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        self.placeholderLabel.isHidden = !textView.text.isEmpty
        self.messageBarSize.invalidSizing()
        self.messageText.value = textView.text
        
        switch textView.text.isEmpty {
        case true:
            self.buttonType = SendButtonType(type:MicrophoneButton())
            self.buttonType.buttonOption(MessageTxt: textView.text, and: self.sendeBtn)
        case false:
            self.buttonType = SendButtonType(type:SendButton())
            self.buttonType.buttonOption(MessageTxt: textView.text, and: self.sendeBtn)
        }
        
    }
    
    override public var intrinsicContentSize: CGSize {
        return self.messageBarSize.size()
    }
    
}

//MARK: - buttonAction
private extension MessageInputView {
    
    
    @objc  func sendMessage(){
        //for listener to Send button onlay and avoid micriophoneButton
        if self.sendeBtn.currentImage == config.icon.sendMessageIcon{
            guard let selected = self.didSelectSendButton else { return }
            selected()
        }else{
            
            //TODO option for micriophone Button
            
        }
        
    }
    
    
    @objc  func sendAttatchment(){
        //here insde this func i use delegate for detect image & video
        self.venomAttachmentButton.showAttachmentOption(in: self.rootViewController!, messageInputView: self)
    }
    
}//End-----------------------------------------

//MARK: - setup userInterface
private extension MessageInputView {
    
    func setupUI() {
        //Attchemnt button
        self.addSubview(attachmentBtn)
        attachmentBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(6)
            $0.leading.equalTo(self.snp.leading).inset(8)
            $0.width.equalTo(35)
            $0.height.equalTo(40)
        }
        
        self.addSubview(sendeBtn)
        sendeBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(6)
            $0.trailing.equalTo(self.snp.trailing).inset(8)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        //messageTxt-------------------
        self.addSubview(self.messageTxt)
        self.messageTxt.snp.makeConstraints {
            $0.trailing.equalTo(sendeBtn.snp.leading).inset(-4)
            $0.leading.equalTo(attachmentBtn.snp.trailing).inset(-4)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(8)
            $0.top.equalTo(self.snp.top).inset(8)
        }
        
        //Attchemnt textViewPlacehholder
        self.messageTxt.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.messageTxt).inset(4)
            $0.height.lessThanOrEqualTo(50)
            $0.top.equalTo(self.messageTxt.snp.top).inset(8)
        }
        
    }
}
