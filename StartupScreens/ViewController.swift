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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove navigation pane from first UI View
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Initialize attributes
        self.backgroundImage.alpha = 0
        self.getStartedButton.alpha = 0
        self.logoImage.alpha = 0
        
        getStartedButton.titleLabel?.font = UIFont (name: "ArialRoundedMTBold", size: 15)
//        getStartedButton.layer.shadowColor = UIColor.lightGray.cgColor
//        getStartedButton.layer.masksToBounds = false
//        getStartedButton.layer.shadowOpacity = 1.0
//        getStartedButton.layer.shadowRadius = 0
//        getStartedButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Fade in the background
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundImage.alpha = 1.0
            
        }, completion: { finished in
            
            // Fade in and shift the Get Started button
            UIView.animate(withDuration: 1.0, delay: 0.6, options: .curveEaseOut, animations: {
                self.getStartedButton.alpha = 1.0
                self.getStartedButton.center.y -= 40
                
            })
        })
        
        // Fade in logo
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.logoImage.alpha = 1.0
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getStartedButtonPressed(_ sender: Any) {
    }

}

