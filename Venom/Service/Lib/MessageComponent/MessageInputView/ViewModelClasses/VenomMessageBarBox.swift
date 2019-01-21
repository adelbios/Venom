//
//  ButtonBox.swift
//  VenomMessageInputBar
//
//  Created by Adel Radwan on 1/1/19.
//  Copyright © 2019 adel radwan. All rights reserved.
//

import Foundation

//this class for observalble buttonType

class VenomMessageBarBox<T> {
    
    typealias Listener = (T)->Void
    var listener : Listener?
    
    var value : T {
        didSet{
            self.listener?(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    
    func bind(_ listener:Listener?){
        self.listener = listener
        self.listener?(value)
    }
    
    
    
}
