//
//  SendMessageController+Settings.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/2/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit
import ActionKit
import AVFoundation
import AVKit



extension SendMessageController {
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messageData.count
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
        VenomMessageCell
         let config = VenomConfiguration.config.messageConsoleView
        
        let data = self.messageData[indexPath.row]
        cell.chatData = data
        
        if data.text != "" {
            self.textMessage(data, cell)
        }else{
            cell.bubbleView(width: config.size.bubbleViewWidth)
        }
        
        
       
        
        cell.playButton.addControlEvent(.touchUpInside) {
//            let vc = VGVerticalViewController()
            guard let url = URL(string: data.videoUrl) else {return}
//            vc.urlString = data.videoUrl
            let vc = VideoViewController(videoURL: url)
//            present(videoViewController, animated: true, completion: nil)
//            let playerVC = AVPlayerViewController()
//            guard let url = URL(string: data.videoUrl) else {return}
//            let player = AVPlayer(playerItem: AVPlayerItem(url:url))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//                playerVC.player = player
                self.present(vc)
            }
        }
    
        
        return cell
    }
    
    
    private func textMessage(_ data: MessageModel, _ cell: VenomMessageCell) {
        let timestamp = Date(timeIntervalSince1970: TimeInterval(data.timeStamp)).toTime
        let messageTxtWidth = self.estematedMessageHeight(text: data.text).width
        let timestampWidth = self.estematedMessageHeight(text: timestamp).width
        var width :CGFloat = 0.0
        
        //beacuae when write message with one alpah message bubble is too small
        //i picked 40 value beacuae when enter one 4 alpha is value from 30 to 41
        if messageTxtWidth <= 40 {
            width  = timestampWidth + 15
        }else{
            width = messageTxtWidth + 30
        }
        
        cell.bubbleView(width: width)
    }
    
}
