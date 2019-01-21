//
//  String+Extension.swift
//  Maleem
//
//  Created by ABDULLAH ALDAHLAWI on 12/18/18.
//  Copyright © 2018 ABDULLAH ALDAHLAWI. All rights reserved.
//

import UIKit

extension String {
    
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    
    
    func localized(forLanguage language: String = Locale.preferredLanguages.first!.components(separatedBy: "-").first!) -> String {
        
        guard let path = Bundle.main.path(forResource: language == "en" ? "Base" : language, ofType: "lproj") else {
            
            let basePath = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            
            return Bundle(path: basePath)!.localizedString(forKey: self, value: "", table: nil)
        }
        
        return Bundle(path: path)!.localizedString(forKey: self, value: "", table: nil)
    }
    
    
    func setSession(val : String){
        UserDefaults.standard.setValue(val, forKey: self)
    }
    
    func getSession(def : String) -> String {
        guard let value =  UserDefaults.standard.string(forKey: self) else { return def }
        return value
    }
    
    
    func estimatedHeight(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UITextView(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
    
    func estimatedWidth(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    
    func convertTimestampToDate(dateStyle : DateFormatter.Style)->String {
        guard let dateTime = Double(self) else { return "have not date" }
        let timeInterval = dateTime /  1000.0
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeZone = TimeZone(abbreviation: "current")
        let createdAt = dateFormatter.string(from: date)
        return createdAt
    }
    
    
    func  convertDigitToEnglish()->NSNumber{
        let str = self
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "EN")
        let number =  formatter.number(from: str)
        return number!
    }
    
    
    func val(){
        print(self)
    }
    
}
