//
//  Constants.swift
//  FlashChat-Firebase
//
//  Created by iOS - Developer on 25.08.2023.
//

import Foundation

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "brandPurple"
        static let lightPurple = "brandLightPurple"
        static let blue = "brandBlue"
        static let lighBlue = "brandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
}
