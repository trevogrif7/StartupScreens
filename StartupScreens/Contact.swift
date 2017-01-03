//
//  Contact.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import Foundation

class Contact {
    
    private var myUsername: String = ""
    private var myEmailAddress: String = ""
    private var myUID: String = ""
    private var myProfileImage = UIImage()
    
    var username: String {
            return myUsername
    }
    
    var emailAddress: String {
        return myEmailAddress
    }

    var UID: String {
        return myUID
    }
    
    var profileImage: UIImage {
        return myProfileImage
    }

    init(username: String, emailAddress: String, UID: String /*,profileImage: UIImaeg*/) {
        myUsername = username
        myEmailAddress = emailAddress
        myUID = UID
        //myProfileImage = profileImage
    }
}
