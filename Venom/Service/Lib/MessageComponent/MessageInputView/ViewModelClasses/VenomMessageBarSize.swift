//
//  VenomMessageBarSize.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit

public class VenomMessageBarSize {

     var maxHeight: CGFloat     = 0
     var minHeight: CGFloat     = 0
     var paddingTop: CGFloat    = 0
     var paddingBottom: CGFloat = 0
     weak var mainView           : UIView!
     weak var messageTxt         : UITextView!
    
    init(mainView:UIView,messageTxt:UITextView) {
        self.mainView = mainView
        self.messageTxt = messageTxt
    }
    
    
    func size()->CGSize{
        self.messageTxt.isScrollEnabled = false
        let size = messageTxt.sizeThatFits(CGSize(width: messageTxt.frame.width - 16, height: CGFloat(MAXFLOAT)))
        let totalHeight = size.height + paddingTop + paddingBottom
        if totalHeight <= maxHeight {
            return CGSize(width: self.mainView.bounds.width, height: max(totalHeight, minHeight))
        } else {
            self.messageTxt.isScrollEnabled = true
            return CGSize(width: self.mainView.bounds.width, height: maxHeight)
        }
    }
    
    func invalidSizing(){
        self.mainView.invalidateIntrinsicContentSize()
        self.mainView.updateConstraints()
    }
    

}


