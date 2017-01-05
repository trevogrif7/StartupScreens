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

protocol FetchDataDelegate: class {
    func dataReceived(contacts: [Contact])
}

class FirebaseDatabaseHelper {
    
    weak var delegate: FetchDataDelegate?

    // Singleton instance of FirebaseDatabaseHelper
    static let sharedInstance = FirebaseDatabaseHelper()
    
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

    func saveUser(UID: String, username: String, email: String, password: String /*, profileImage: UIImage*/) {
        
        let userData: Dictionary<String, Any> = [Const.USERNAME: username, Const.EMAIL_ADDRESS: email, Const.PASSWORD: password /*, Const.PROFILE_IMAGE*/]
        
        contactsRef.child(UID).setValue(userData)
        
    }
    
    func getContacts() {

        // Become observer
        contactsRef.observeSingleEvent(of: .value, with: { (contactDatabase) in
           
            var contacts = [Contact]()
            
            // Get all contact dictionaries
            if let myContacts = contactDatabase.value as? NSDictionary {

                // Loop through all contact key value pairs ("key" is the uid of each contact)
                for (key, value) in myContacts {

                    // Access contact data dictionary
                    if let myContactDictionary = value as? NSDictionary {
                        
                        // Save the individual pieces of data for this contact and append to array of contacts
                        if let emailAddress = myContactDictionary[Const.EMAIL_ADDRESS] as? String {
                            if let username = myContactDictionary[Const.USERNAME] as? String {
                                let UID = key as! String
                                
                                let newContact = Contact(username: username, emailAddress: emailAddress, UID: UID)
                                
                                contacts.append(newContact)
                                
                            }
                            
                        }
                    }
                    
                }
            }
            
            self.delegate?.dataReceived(contacts: contacts)
        })
        
    }
    
}
