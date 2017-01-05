//
//  HelperFunctions.swift
//  My Helper Functions
//
//  Created by Trevor Griffin on 10/12/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    // Singleton instance of FirebaseAuthHelper class
    static let sharedInstance = Helper()
    
    // Limit the create of these objects to this one
    private init () {}

    // Define OK alert Action with cancel style
    let alertAction_OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)

    let alertAction_Cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    // Function to handle selection and capture of image and videos
    func selectVisualMedia(target: UIViewController, imagePicker: UIImagePickerController, includeVideo: Bool) {
        // If we have access to the camera but not the photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) && !(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            self.captureMedia(target: target, imagePicker: imagePicker, includeVideo: includeVideo)
            
            // If we have access to the photo library but not the camera
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            self.openPhotoLibrary(target: target, imagePicker: imagePicker, includeVideo: includeVideo)
            
            // If we have access to both the camera and photo library
        } else if UIImagePickerController.isSourceTypeAvailable(.camera) && UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let alertController = UIAlertController(title: "Please Select", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let libraryAction = UIAlertAction(title: "Media Library", style: UIAlertActionStyle.default, handler: {UIAlertAction in self.openPhotoLibrary(target: target, imagePicker: imagePicker, includeVideo: includeVideo)})
            let cameraAction = UIAlertAction(title: "Capture Photo/Video", style: UIAlertActionStyle.default, handler: {UIAlertAction in self.captureMedia(target: target, imagePicker: imagePicker, includeVideo: includeVideo)})
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(libraryAction)
            alertController.addAction(cameraAction)
            alertController.addAction(cancelAction)
            
            target.present(alertController, animated: true, completion: nil)
            
            // If we don't have access to either source of images
        } else {
            let alertController = UIAlertController(title: "Alert", message: "Your device does not support the camera or photo library", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            target.present(alertController, animated: true, completion: nil)
        }

    }

    // Helper funciton for accessing the camera
    private func captureMedia(target: UIViewController, imagePicker: UIImagePickerController, includeVideo: Bool) {
        
        // Select Camera as the source
        imagePicker.sourceType = .camera

        if includeVideo == true {
            // Allow access videos
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
        }
        
        imagePicker.allowsEditing = true
        target.present(imagePicker, animated: true, completion: nil)
        
    }
    
    // Helper funciton for accessing the photo library
    private func openPhotoLibrary(target: UIViewController, imagePicker: UIImagePickerController, includeVideo: Bool) {
        
        // Select Photo Library as the source
        imagePicker.sourceType = .photoLibrary
        
        if includeVideo == true {
            // Allow access videos
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        }
        
        imagePicker.allowsEditing = true
        target.present(imagePicker, animated: true, completion: nil)
        
    }

}

extension UIView {
    
    // Make UIView item fade in
    func fadeInView(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    // Make UIView item fade out
    func fadeOutView(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        })
    }
    
    // Make UIView's background shift between three colors
    func animateBackgroundColor(iterations: Int, color1: UIColor = UIColor.lightGray, color2: UIColor = UIColor.gray, color3: UIColor = UIColor.darkGray) {
        
        // Iterator
        var iter = iterations
        
        // Animate background color transition. Recursivley call the
        // function infinitely.
        UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
            self.backgroundColor = color1
        }, completion: { (Bool)  in
            
            UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
                self.backgroundColor = color2
            }, completion: { (Bool) in
                
                UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
                    self.backgroundColor = color3
                }, completion: { (Bool) in
                    if iter == -1 {
                        
                        // A "-1" value for iteration will cause the animation to keep excuting forever
                        self.animateBackgroundColor(iterations: -1, color1: color1, color2: color2, color3: color3)
                    }
                    else if iter > 0
                    {
                        // Subtract 1 iterations
                        iter -= 1
                        
                        // Recursive call
                        self.animateBackgroundColor(iterations: iter, color1: color1, color2: color2, color3: color3)
                    }
                    
                })
            })
        })
    }
    
}

class zoomSegue: UIStoryboardSegue {
    
    override func perform() {
        zoom()
    }
    
    func zoom () {
        let currentViewController = self.source
        let nextViewController = self.destination
        
        let container = currentViewController.view.superview
        
        nextViewController.view.center = currentViewController.view.center
        nextViewController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        container?.addSubview(nextViewController.view)
        
        UIView.animate(withDuration: 0.3, animations: {
            nextViewController.view.transform = CGAffineTransform.identity
        }) { (complete) in
            currentViewController.present(nextViewController, animated: false, completion: nil)
        }
        
    }
    
}


