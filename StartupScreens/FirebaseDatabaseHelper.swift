//
//  FirebaseDatabaseHelper.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class FirebaseDatabaseHelper {

    // Singleton instance of FirebaseDatabaseHelper
    static let instance = FirebaseDatabaseHelper()
    
    // Limit the create of these objects to this one
    private init () {}
    
    // Access Database
    var databaseRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }

    var contactsRef: FIRDatabaseReference {
        return databaseRef.child(Const.CONTACTS)
    }
    
    var messagesRef: FIRDatabaseReference {
        return databaseRef.child(Const.MESSAGES)
    }

    var mediaMessagesRef: FIRDatabaseReference {
        return databaseRef.child(Const.MEDIA_MESSAGES)
    }
    
    // Access Storage
    var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://startupscreens-d9de6.appspot.com")
    }
    
    var imageDataRef: FIRStorageReference {
        return storageRef.child(Const.IMAGE_DATA)
    }
    
    var videoDataRef: FIRStorageReference {
        return storageRef.child(Const.VIDEO_DATA)
    }
    
        
    
    ///////////..................
    var usernameRef: FIRDatabaseReference {
        return databaseRef.child(Const.USERNAME)
    }
    
    var emailAddressRef: FIRDatabaseReference {
        return databaseRef.child(Const.EMAIL_ADDRESS)
    }
    
    var passwordRef: FIRDatabaseReference {
        return databaseRef.child(Const.PASSWORD)
    }
    
    var dataRef: FIRDatabaseReference {
        return databaseRef.child(Const.DATA)
    }

    func saveUser(UID: String, username: String, email: String, password: String) {
        
        let userData: Dictionary<String, Any> = [Const.USERNAME: username, Const.EMAIL_ADDRESS: email, Const.PASSWORD: password]
        
        contactsRef.child(UID).setValue(userData)
        
    }
    
}
