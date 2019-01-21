//
//  YPWordings.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 12/03/2018.
//  Copyright © 2018 Yummypets. All rights reserved.
//

import Foundation

public struct YPWordings {
    
    public var permissionPopup = PermissionPopup()
    public var videoDurationPopup = VideoDurationPopup()

    public struct PermissionPopup {
        public var title   = "Permission denied"
        public var message = "Please allow access"
        public var cancel  = "Cancel"
        public var grantPermission = "Grant Permission"
    }
    
    public struct VideoDurationPopup {
        public var title = "Video duration"
        public var tooShortMessage = "The video must be at least %@ seconds"
        public var tooLongMessage = "Pick a video less than %@ seconds long"
    }
    
    public var ok           = "Okay"
    public var done         = "Done"
    public var cancel       = "Cancel"
    public var save         = "Save"
    public var processing   = "Processing.."
    public var trim         = "Trim"
    public var cover        = "Cover"
    public var albumsTitle  = "Albums"
    public var libraryTitle = "Library"
    public var cameraTitle  = "Photo"
    public var videoTitle   = "Video"
    public var next         = "Next"
    public var filter       = "Filter"
    public var crop         = "Crop"
    public var warningMaxItemsLimit = "The limit is %d photos or videos";
}

