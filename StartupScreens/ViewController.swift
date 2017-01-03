//
//  ViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/17/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var registeredTrademarkLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var blurVisualEffect: UIVisualEffectView!
    @IBOutlet weak var mottoLabel: UILabel!
    
    // Variables to control animation of the background
    var backgroundImageArray : [UIImage] = [UIImage]()
    var imageIterator : Int = 0
    let nextImage : UIImageView = UIImageView()
    let currentImage : UIImageView = UIImageView()
    var continueAnimatingBackground : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove navigation pane from first UI View
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.hidesBackButton = true
        
        // Initialize attributes
        self.backgroundImage.alpha = 0
        self.getStartedButton.alpha = 0
        self.logoLabel.alpha = 0
        self.mottoLabel.alpha = 0
        self.registeredTrademarkLabel.alpha = 0
        self.getStartedButton.titleLabel?.font = UIFont (name: "GillSans", size: 20)
        
        self.logoLabel.font = UIFont(name: "GillSans", size: 120)
        self.mottoLabel.font = UIFont(name: "Arial", size: 25)
        
        // Set up background image array
        self.backgroundImageArray = [UIImage(named: "background1")!, UIImage(named: "background2")!, UIImage(named: "background3")!, UIImage(named: "background4")!, UIImage(named: "background5")!, UIImage(named: "background6")!]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuthHelper.instance.isLoggedIn() {
            performSegue(withIdentifier: "stillSignedInSegue", sender: self)
        }
        
        // Fade in the background
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundImage.alpha = 1.0
            
        }, completion: { finished in
            
            // Fade in and shift the Get Started button
            UIView.animate(withDuration: 0.5, delay: 0.6, options: .curveEaseOut, animations: {
                self.getStartedButton.alpha = 1.0
                self.getStartedButton.center.y -= 40
                self.mottoLabel.alpha = 1

            })
        })
        
        // Fade in logo
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.logoLabel.alpha = 1.0
            self.registeredTrademarkLabel.alpha = 1.0
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
      
        if continueAnimatingBackground == true {
            // Animate background color transition. Recursivley call the function
            UIView.animate(withDuration: 4.5, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
                self.currentImage.alpha = 0
                self.nextImage.alpha = 1
            }) { (Bool) in
                self.backgroundImage.image = self.nextImage.image
                self.animateBackgroundImage()
            }
        }
    }
    
    func displayAnimatedMessages () {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        self.continueAnimatingBackground = false
        self.currentImage.layer.removeAllAnimations()
        self.nextImage.layer.removeAllAnimations()
        self.backgroundImage.layer.removeAllAnimations()
        self.getStartedButton.layer.removeAllAnimations()
        self.getStartedButton.center.y += 40
        self.mottoLabel.layer.removeAllAnimations()
        self.logoLabel.layer.removeAllAnimations()
        self.registeredTrademarkLabel.layer.removeAllAnimations()


    }

}

