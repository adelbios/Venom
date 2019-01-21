//
//  VenomMessageCell.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/2/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

class BaseTableViewCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    func setupLayout(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class VenomMessageCell: BaseTableViewCell {
    
    
    private let config = VenomConfiguration.config.messageConsoleView
    
    
    var isHiddeReadImageView : Bool = false {
        didSet{
            if self.isHiddeReadImageView == true  {
                self.readImageView.isHidden = true
                self.remarkConstraintFor(timeLabel: self.timeMessageLabel)
            }//end if
        }//end didSet
    }
    
    lazy var textView : UITextView = {
        let t = UITextView(frame: CGRect())
        t.font = UIFont.systemFont(ofSize: 16)
        t.backgroundColor = .clear
        t.textColor = .black
        t.isEditable = false
        t.isScrollEnabled = false
        return t
    }()
    
    
    lazy var messageImageView : UIImageView = {
        let t = UIImageView()
        t.contentMode = .scaleAspectFill
        t.layer.cornerRadius = 5
        t.layer.masksToBounds = true
        t.isUserInteractionEnabled = true
        //        t.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleImageZoomTap(_:))))
        return t
    }()
    
    
    lazy var bubbleView : UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()
    
    
    //    @objc func handleImageZoomTap(_ tap : UITapGestureRecognizer){
    //        guard let imageview = tap.view as? UIImageView else { return }
    //        self.chatLogVC?.performZoomInFor(imageView: imageview)
    //    }
    
    
    private  var bottomView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var timeMessageLabel : UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "23/07/2018"
        l.font = UIFont.systemFont(ofSize: 11)
        l.textAlignment = .right
        
        return l
    }()
    
    private lazy var readImageView : UIImageView = {
        let i = UIImageView(image: #imageLiteral(resourceName: "yp_iconFlash_off"))
        i.tintColor = .white
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    
    var chatData : VenomData!{
        didSet{
            self.isHiddeReadImageView = true
            self.textView.text = chatData.message
            self.messageImageView.isHidden = true
            self.textView.isHidden = false
            
            
            if chatData.fromId == "1" {
                
                self.textView.textColor             = config.color.senderTextColor
                self.textView.textAlignment         = config.option.senderMessageTextAlignment
                self.timeMessageLabel.textAlignment = config.option.senderTimeMessageAlignment
                self.bubbleView.backgroundColor     = config.color.senderBubbleViewColor
                self.timeMessageLabel.textColor     = config.color.senderBottomViewTextColor
                self.bubbleViewForCurrentUser()
                
            }else{
                self.bubbleViewForOtherUser()
                self.textView.textColor             = config.color.reciverTextColor
                self.textView.textAlignment         = config.option.reciverMessageTextAlignment
                self.timeMessageLabel.textAlignment = config.option.reciverTimeMessageAlignment
                self.bubbleView.backgroundColor     = config.color.reciverBubbleViewColor
                self.timeMessageLabel.textColor     = config.color.reciverBottomViewTextColor
                
            }
        }
    }
    
    //    var messageData : MyConversations! {
    //        didSet{
    //
    //            guard let d = self.messageData else { return }
    //
    //            self.textColor              = .white
    //            self.bubbleViewCornerRadius = 5
    //
    //            if d.message == "" {
    //                self.messageImageView.loadImageWith(d.file_link)
    //                self.messageImageView.isHidden = false
    //                self.textView.isHidden = true
    //                self.bubbleView.backgroundColor = .clear
    //            }else{
    //                self.textView.text = d.message
    //                self.messageImageView.isHidden = true
    //                self.textView.isHidden = false
    //            }
    //
    //            let date = d.created_at.components(separatedBy: " ")[1]
    //            let time = date.components(separatedBy: ":")
    //            self.timeMessageLabel.text = "\(time[0]):\(time[1])"
    //            if Users.id() == d.sender_id { //from user
    //                self.textView.textAlignment = .right
    //                self.isHiddeReadImageView   = true
    //                self.timeMessageAlignment   = .right
    //                self.bubbleView.backgroundColor = .appBlue
    //                self.bubbleViewForCurrentUser()
    //                self.bottomViewTextColor    = .materialBlue
    //
    //            }else{ // to user
    //                self.bubbleViewForOtherUser()
    //                self.bubbleViewColor        = .materialBlue
    //                self.isHiddeReadImageView   =  true
    //                self.timeMessageAlignment   = .left
    //                self.bottomViewTextColor    = .appBlue
    //            }
    //        }
    //    }
    
    
    override func setupLayout() {
        
        addSubview(self.bubbleView)
        self.bubbleView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.snp.trailing).inset(8)
            s.top.equalTo(self.snp.top)
            s.height.equalTo(self.snp.height)
            s.width.equalTo(config.size.bubbleViewWidth)
        }
        
        addSubview(self.textView)
        self.textView.snp.makeConstraints { (s) in
            s.leading.equalTo(self.bubbleView.snp.leading).inset(8)
            s.top.equalTo(self.snp.top)
            s.trailing.equalTo(self.bubbleView.snp.trailing)
            s.height.equalTo(self.snp.height)
        }
        
        addSubview(self.bottomView)
        self.bottomView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.bubbleView.snp.trailing).inset(8)
            s.bottom.equalTo(self.bubbleView.snp.bottom).inset(4)
            s.leading.equalTo(self.bubbleView.snp.leading).inset(4)
            s.height.equalTo(15)
        }
        
        self.bubbleView.addSubview(self.messageImageView)
        self.messageImageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(self.bubbleView)
        }
        
        
        self.setupReadRespicetUI()
    }
    
    
    
    private func setupReadRespicetUI(){
        
        self.bottomView.addSubview(self.readImageView)
        self.readImageView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.bottomView.snp.trailing).inset(2)
            s.width.height.equalTo(13)
            s.top.equalTo(self.bottomView.snp.top)
        }
        
        self.bottomView.addSubview(self.timeMessageLabel)
        self.timeMessageLabel.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.bottomView.snp.trailing).inset(0)
            s.leading.equalTo(self.bottomView.snp.leading)
            s.top.equalTo(self.bottomView.snp.top)
            s.bottom.equalTo(self.bottomView.snp.bottom)
        }
        
    }
    
    
    private func remarkConstraintFor(timeLabel : UILabel){
        timeLabel.snp.remakeConstraints { s in
            s.trailing.equalTo(self.bottomView.snp.trailing).inset(8)
            s.leading.equalTo(self.bottomView.snp.leading).inset(0)
            s.top.equalTo(self.bottomView.snp.top)
            s.bottom.equalTo(self.bottomView.snp.bottom)
        }
    }
    
    
    
    func bubbleView(width:CGFloat){
        self.bubbleView.snp.updateConstraints { (s) in
            s.width.equalTo(width)
        }
    }
    
    func bubbleViewForOtherUser(){
        self.bubbleView.snp.remakeConstraints { (s) in
            s.leading.equalTo(self.snp.leading).inset(8)
            s.top.equalTo(self.snp.top)
            s.height.equalTo(self.snp.height)
            s.width.equalTo(config.size.bubbleViewWidth)
        }
    }
    
    
    func bubbleViewForCurrentUser(){
        self.bubbleView.snp.remakeConstraints { (s) in
            s.trailing.equalTo(self.snp.trailing).inset(8)
            s.top.equalTo(self.snp.top)
            s.height.equalTo(self.snp.height)
            s.width.equalTo(config.size.bubbleViewWidth)
        }
    }
    
    
}
