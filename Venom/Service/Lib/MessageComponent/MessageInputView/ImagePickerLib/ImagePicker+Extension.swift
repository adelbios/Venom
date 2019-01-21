//
//  extension.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Photos

extension YPImagePicker {
    
    //    [YPMediaItem]()
    class func implementImagePicker(screens : [YPPickerScreen],
                                    startScreen : YPPickerScreen,
                                    maxSelectedItem : Int,
                                    rootViewController : UIViewController?,
                                    completionPhoto:@escaping(_ image :UIImage)->Void = {_ in},
                                    completionVideo:@escaping(_ thumbImage :UIImage,_ videoURL:URL)->Void = {_,_ in}){
        guard let vc = rootViewController else {
            return
        }
        var config = YPImagePickerConfiguration()
        
        config.library.mediaType            = .photoAndVideo
        config.library.onlySquare           = false
        config.onlySquareImagesFromCamera   = true
        config.usesFrontCamera              = true
        config.shouldSaveNewPicturesToAlbum = false
        config.hidesStatusBar               = false
        config.isScrollToChangeModesEnabled = true
        config.colors.tintColor = .white
        config.targetImageSize = .original
        config.albumName = "Venom"
        config.screens = screens
        config.startOnScreen = startScreen
        config.showsCrop = .rectangle(ratio: (1/1))       
        config.library.maxNumberOfItems = maxSelectedItem
        config.library.minNumberOfItems = 0
        let picker = YPImagePicker(configuration: config)
        vc.present(picker, animated: true)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            if cancelled {
                print("Picker was canceled")
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            if let firstItem = items.first {
                switch firstItem {
                case .photo(let photo):
                    completionPhoto(photo.image)
                    picker.dismiss(animated: true, completion: nil)
                case .video(let video):
                    completionVideo(video.thumbnail,video.url)
                    picker.dismiss(animated: true, completion: nil)
                }
            }
        }
        
        
        
//        picker.didFinishPicking { [unowned picker] items, cancelled in
//            if cancelled {
//                print("Picker was canceled")
//                picker.dismiss(animated: true, completion: nil)
//                return
//            }
//            guard let firstItem = items.first else { return }
//
//
//            switch firstItem {
//            case.photo(p: let photo):
//                completion(items,photo.image)
//                picker.dismiss(animated: true, completion: nil)
//            case.video(v: _):
//                return
//            }
//
//
//        }
        
    }//end func
    
    
    private class func resolutionForLocalVideo(url: URL) -> CGSize? {
        guard let track = AVURLAsset(url: url).tracks(withMediaType: AVMediaType.video).first else { return nil }
        let size = track.naturalSize.applying(track.preferredTransform)
        return CGSize(width: abs(size.width), height: abs(size.height))
    }
    
    
    /*
 
     let assetURL = video.url
     let playerVC = AVPlayerViewController()
     let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
     playerVC.player = player
     
     picker.dismiss(animated: true, completion: { [weak rootViewController] in
     rootViewController?.present(playerVC, animated: true, completion: nil)
     print("😀 \(String(describing: self.resolutionForLocalVideo(url: assetURL)!))")
     })
 
 */
    
}
