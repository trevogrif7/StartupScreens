//
//  ViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/17/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var blurVisualEffect: UIVisualEffectView!
    
    // Array of background images
    var backgroundImageArray = [UIImage]()
    var imageIterator = 0
    let nextImage = UIImageView()
    let currentImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove navigation pane from first UI View
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        
        // Initialize attributes
        self.backgroundImage.alpha = 0
        self.getStartedButton.alpha = 0
        self.logoImage.alpha = 0
        self.getStartedButton.titleLabel?.font = UIFont (name: "ArialRoundedMTBold", size: 15)
        
        // Set up background image array
        self.backgroundImageArray = [UIImage(named: "background1")!, UIImage(named: "background2")!, UIImage(named: "background3")!, UIImage(named: "background4")!, UIImage(named: "background5")!]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Fade in the background
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundImage.alpha = 1.0
            
        }, completion: { finished in
            
            // Fade in and shift the Get Started button
            UIView.animate(withDuration: 0.5, delay: 0.6, options: .curveEaseOut, animations: {
                self.getStartedButton.alpha = 1.0
                self.getStartedButton.center.y -= 40
                
            })
        })
        
        // Fade in logo
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.logoImage.alpha = 1.0
        })
        
        // Start background image loop
        currentImage.frame = self.view.frame // match the size of the view
        nextImage.frame = self.view.frame
        animateBackgroundImage()

    }
    
    func animateBackgroundImage () {
        // Set the current image
        currentImage.image = self.backgroundImageArray[self.imageIterator]
        
        // Update iterator
        if imageIterator == backgroundImageArray.count-1 {
            imageIterator = 0
        }
        else {
            imageIterator += 1
        }
        
        // the next image should start out invisible
        nextImage.image = self.backgroundImageArray[self.imageIterator]
        nextImage.alpha = 0
        
        // Add the image views as subviews
        self.view.insertSubview(nextImage, aboveSubview: backgroundImage)
        self.view.insertSubview(currentImage, aboveSubview: nextImage)
        
        // Animate background color transition. Recursivley call the
        // function infinitely.
        UIView.animate(withDuration: 4.5, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.currentImage.alpha = 0
            self.nextImage.alpha = 1
        }) { (Bool) in
            self.backgroundImage.image = self.nextImage.image
            self.animateBackgroundImage()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getStartedButtonPressed(_ sender: Any) {
    }

}

