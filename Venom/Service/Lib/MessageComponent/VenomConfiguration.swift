//
//  MessageColors.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit


//TODO add congig for Image Pickering like color & icon & font

public class VenomConfiguration {
    
    static let config = VenomConfiguration()
    private init(){}
    
    let messageInputView   = MessageInputViewCongiguration()
    let messageConsoleView = messageConsoleViewCongiguration()
}

class MessageInputViewCongiguration {
    
    let font    = Fonts()
    let color   = Colors()
    let wording = Wording()
    let size    = Size()
    let icon    = Images()
    
}


class messageConsoleViewCongiguration {
    
    let font    = ConsoleFonts()
    let color   = ConsoleColors()
    let size    = ConsoleSize()
    let option  = Option()
    
}

class ConsoleColors {
    
    var senderBubbleViewColor       : UIColor = .black
    var reciverBubbleViewColor      : UIColor = .red
    var senderTextColor             : UIColor = .white
    var reciverTextColor            : UIColor = .white
    var senderBottomViewTextColor   : UIColor = .orange
    var reciverBottomViewTextColor  : UIColor = .black

}

class ConsoleFonts {
    
    var messegeTxtFont : UIFont = UIFont.systemFont(ofSize: 16)
}

class ConsoleSize {

    var bubbleViewWidth:CGFloat = 250
}

class Option {
 
    var bubbleViewCornerRadius       : CGFloat = 0.0
    var senderTimeMessageAlignment   : NSTextAlignment = .right
    var reciverTimeMessageAlignment  : NSTextAlignment = .left
    var senderMessageTextAlignment   : NSTextAlignment = .right
    var reciverMessageTextAlignment  : NSTextAlignment = .left
    
}




class Colors {
    
    // this configuration for MessageInputView ******************
    
    //this area for button in message Text console----------
    var sendButtonColor      : UIColor = .black
    var attchmentButtonColor : UIColor = .black
    //End button in message Text  ----------------------
    
    //this area for message Text console----------
    var messegTxtColor     : UIColor  = .black
    var messageBorderColor : UIColor  = .black
    var placeholderColor   : UIColor  = .black

    //End message Text console------------------

    //End configuration for MessageInputView ******************
    
}

 class Fonts {
    // this configuration for MessageInputView ******************
    var messegeTxtFont : UIFont = UIFont.systemFont(ofSize: 14)
    //End configuration for MessageInputView ******************
}

class Wording {
    
    var messegePlaceholder = "message"
    var attchmentLibrary   = "Photo or Video"
    var attchmentPhoto     = "Photo shot"
    var attchmentVideo     = "Video shot"
}

class Size {
    
    // this configuration for MessageInputView ******************
    var messageBorderWidth:CGFloat       = 0.6
    var messageTxtPaddingTop :CGFloat    = 8.0
    var messageTxtPaddingBottom :CGFloat = 8.0
    var messageTxtMinHeight :CGFloat     = 49.0
    var messageTxtMaxHeight :CGFloat     = 125.0
    //End configuration for MessageInputView ******************
    
}


class Images {
    
    // this configuration for MessageInputView ******************
    var attchmentIcon  : UIImage = #imageLiteral(resourceName: "attchment").withRenderingMode(.alwaysTemplate)
    var sendMessageIcon: UIImage = #imageLiteral(resourceName: "send").withRenderingMode(.alwaysTemplate)
    var microphoneIcon : UIImage = #imageLiteral(resourceName: "microphone").withRenderingMode(.alwaysTemplate)
    //End configuration for MessageInputView ******************
    
}
