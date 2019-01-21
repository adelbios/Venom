//
//  Firebase+Helper.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/19/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit
import FirebaseAuth

enum  User : String{
    
    case key       = "user"
    case firstName = "firstName"
    case lastName  = "lastName"
    case userName  = "userName"
    case email     = "email"
    case country   = "country"
    
}


enum  Constant : String{
    
   case key           = "Constant"
   case aboutUs       = "about_us"
   case twitterLink   = "twitter_link"
   case facebookLink  = "facebook_link"
   case snapchatLink  = "snapchat_link"
   case telegramLink  = "telegram_link"
   case instagramLink = "instagram_link"

}

enum  Images : String{
    
    case id    = "id"
    case image = "photo"
    
}

extension Dictionary where Dictionary  == [String:AnyObject]  {
    
    func bind(_ dictionary : User)->String {
        return self[dictionary.rawValue] as? String ?? ""
    }
    
    func bind(_ dictionary : Images)->String {
        return self[dictionary.rawValue] as? String ?? ""
    }
    
    func bind(_ dictionary : Images)->Data {
        return self[dictionary.rawValue] as? Data ?? Data()
    }
    
    func bind(_ dictionary : Constant)->String {
        return self[dictionary.rawValue] as? String ?? ""
    }
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password is incorrect. Please try again or use 'Forgot password' to reset your password"
        default:
            return "Unknown error occurred"
        }
    }
}


extension UIViewController{
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alert)
            }            
        }
    }
    
}
