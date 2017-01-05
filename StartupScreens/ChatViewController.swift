//
//  ChatViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/3/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import MobileCoreServices
import AVKit

class ChatViewController: JSQMessagesViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Variable to hold messages
    var messages = [JSQMessage]()
    
    // Used to get images
    let imagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.senderId = "Alpha"
        self.senderDisplayName = "TEG"
        
    }

    // Return message at indexpath
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    // return the number of messages
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell
    }
    
    // Create message bubble
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let messageBubbleFactory = JSQMessagesBubbleImageFactory()
        //let message = messages[indexPath.item]
        
        return messageBubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.gray)
    }
    
    
    // Create avatar image to appear next to message
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: "background1"), diameter: 30)
    }
    
    // Append the next message to the message thread
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        messages.append(JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text))
        
        finishSendingMessage(animated: true)
    }
    
    // Send images and videos
    override func didPressAccessoryButton(_ sender: UIButton!) {
        Helper.sharedInstance.selectVisualMedia(target: self, imagePicker: imagePickerController, includeVideo: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
