//
//  MessagesHandler.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/6/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

protocol MessageReceivedDelegate: class {
    func messageReceived(senderID: String, senderName: String, messageText: String)
}

class MessagesHandler {
    
    // Singleton instance of FirebaseAuthHelper class
    private static let _sharedInstance = MessagesHandler()
    
    static var sharedInstance: MessagesHandler {
        return _sharedInstance
    }
    
    // Limit the create of these objects to this one
    private init () {}
    
    weak var delegate: MessageReceivedDelegate?
  
    // Send text messages data to be stored in Firebase
    func sendMessage(senderID: String, senderName: String, messageText: String) {
        
        let messageData: Dictionary<String, Any> = [Const.SENDER_ID: senderID, Const.SENDER_NAME: senderName, Const.MESSAGE_TEXT: messageText]
        
        FirebaseDatabaseHelper.sharedInstance.messagesRef.childByAutoId().setValue(messageData)
    }
    
    // Listen for any text message data in Firebase and retrieve
    func messageListener() {
        FirebaseDatabaseHelper.sharedInstance.messagesRef.observe(.childAdded, with: { (snapshot) in
            
            if let messageData = snapshot.value as? NSDictionary {
                if let senderID = messageData[Const.SENDER_ID] as? String {
                    if let senderName = messageData[Const.SENDER_NAME] as? String {
                        if let messageText = messageData[Const.MESSAGE_TEXT] as? String {
                            self.delegate?.messageReceived(senderID: senderID, senderName: senderName, messageText: messageText)
                        }
                        
                    }
                }
            }
        })
    }
    
    // Send media message data to be stored in Firebase
    func sendMedia(senderID: String, senderName: String, image: Data?, video: URL?) {
        
        // Check that there is an image
        if image != nil {
            
        } else {
            
        }
        
    }
}
