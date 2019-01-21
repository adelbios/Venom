//
//  AppString.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/21/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

class ControllerString {
    
    enum Register : String {
    
        case title               = "Register"
        case regFName            = "Enter first name"
        case regLName            = "Enter last name"
        case regEmail            = "Enter email address"
        case regUserName         = "Enter user name"
        case regPassword         = "Enter password"
        case regConfirmPassword  = "Enter password confirmation"
        case regCountry          = "Enter country"
        case picker              = "Select country from menu"
        case button              = "Create account"
        case fName               = "First name"
        case lName               = "Last name"
        case email               = "Email"
        case userName            = "User name"
        case password            = "Password"
        case confirmPassword     = "Password confirmation"
        case country             = "Country"
        
    }
    
    enum Login : String {
       
        case title          = "Login"
        case loginEmail     = "Enter email address"
        case loginPass      = "Enter password"
        case email          = "Email"
        case password       = "Password"
        case createAccount  = "I don't have account"
        case forgotPassword = "Forgot password"
        case cancel         = "Cancel"
        case resetPass      = "Reset Password"
        case resetFailed    = "Reset Failed"
        case error          = "Error:"
        case okay           = "Okay"
        case resetsuccess   = "Reset email sent successfully"
        case checkEmail     = "Check your email"
        
    }
    
    enum Validation : String {
        
       case required   = "This field is required"
       case email      = "Must be a vaild email address"
       case confirm    = "Password field does not match"
       case newConfirm = "New password field does not match"
        
    }
    
    
    
    enum Update : String {
        case title                = "user profile"
        case oldPass              = "Old password"
        case newPass              = "New password"
        case confirmPass          = "Confirm new password"
        case updateOldPass        = "Enter old password"
        case updateNewPass        = "Enter new password"
        case updateNewConfirmPass = "Enter new password confirmation"
        case button               = "Save Changes"
        
    }
    
    
    
    enum History:String {
        case title = "history"
    }

}
