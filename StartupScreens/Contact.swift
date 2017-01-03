//
//  Contact.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import Foundation

class Contact {
    
    var username: String {
        get {
            return self.username
        }
        set(username) {
            self.username = username
        }
    }
    
    var emailAddress: String {
        get {
            return self.emailAddress
        }
        set(emailAddress) {
            self.emailAddress = emailAddress
        }
    }

    var UID: String {
        get {
            return self.UID
        }
        set(UID) {
            self.UID = UID
        }
    }

    init(username: String, emailAddress: String, UID: String) {
        self.username = username
        self.emailAddress = emailAddress
        self.UID = UID
    }
}
