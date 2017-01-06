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

class ChatViewController: JSQMessagesViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MessageReceivedDelegate {

    // Variable to hold messages
    var messages = [JSQMessage]()
    
    // Used to get images
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegates to self
        imagePicker.delegate = self
        MessagesHandler.sharedInstance.delegate = self
        
        // Update senderID and senderDisplayName with data retrieved from Firebase database
        self.senderId = FirebaseAuthHelper.sharedInstance.userID()
        self.senderDisplayName = FirebaseAuthHelper.sharedInstance.username
        
        // Listen for message updates
        MessagesHandler.sharedInstance.messageListener()
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, didTapMessageBubbleAt indexPath: IndexPath!) {
        let message = messages[indexPath.item]
        
        if message.isMediaMessage {
            if let videoItem = message.media as? JSQVideoMediaItem {
                
                // Create video player and play video
                let videoPlayer = AVPlayer(url: videoItem.fileURL)
                let playerVC = AVPlayerViewController()
                
                playerVC.player = videoPlayer
                
                self.present(playerVC, animated: true, completion: nil)
            }
        }
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
        
        MessagesHandler.sharedInstance.sendMessage(senderID: senderId, senderName: senderDisplayName, messageText: text)
        
        finishSendingMessage(animated: true)
    }
    
    
    /// MEDIA CAPTURE FUNCTIONS
    
    // Send images and videos
    override func didPressAccessoryButton(_ sender: UIButton!) {
        Helper.sharedInstance.selectVisualMedia(target: self, imagePicker: imagePicker, includeVideo: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Get image and set as profile picture
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let image_JSQ = JSQPhotoMediaItem(image: image)
            
            self.messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, media: image_JSQ))
        }
        else if let videoURL = info[UIImagePickerControllerMediaURL] as? URL {

            let video = JSQVideoMediaItem(fileURL: videoURL, isReadyToPlay: true)
            
            self.messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, media: video))
        }
        
        // Dismiss image picker
        dismiss(animated:true, completion: nil)
        
        // Refresh messaging collection view
        collectionView.reloadData()
    }
    
    
    // Dismiss image picker when cancel is pressed and no image is selected
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss image picker
        dismiss(animated: true, completion: nil)
    }

    /// END MEDIA CAPTURE FUNCTIONS
    
    func messageReceived(senderID: String, senderName: String, messageText: String) {
        messages.append(JSQMessage(senderId: senderID, displayName: senderName, text: messageText))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
