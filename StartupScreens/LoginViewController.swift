//
//  LoginViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/17/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    // Variables to control background animation
    var backgroundColorsArray = [UIColor]()
    var colorIterator  = 0
    
    let OFF_SCREEN_POINT = 800.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize attributes
        signInButton.layer.borderWidth = 0.5
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        self.emailTextField.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.passwordTextField.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.signInButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.forgotPasswordButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.createAccountButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        
        self.emailTextField.isHidden = true
        self.passwordTextField.isHidden = true
        self.signInButton.isHidden = true
        self.forgotPasswordButton.isHidden = true
        self.createAccountButton.isHidden = true
       
        self.backgroundColorsArray = [
            UIColor(red: 00/255, green: 122/255, blue: 215/255, alpha: 0.8),
            UIColor(red: 00/255, green: 75/255, blue: 120/255, alpha: 1.0)]
        
        // Constantly shift background color
        animateBackgroundColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        // Set email text field as first responders so that the user can immediately type their email address
        self.emailTextField.becomeFirstResponder()

        // Un-hide UI elements
        self.emailTextField.isHidden = false
        self.passwordTextField.isHidden = false
        self.signInButton.isHidden = false
        self.forgotPasswordButton.isHidden = false
        self.createAccountButton.isHidden = false

        
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.emailTextField.center.x += CGFloat(self.OFF_SCREEN_POINT)
            
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.passwordTextField.center.x += CGFloat(self.OFF_SCREEN_POINT)
            
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.signInButton.center.x += CGFloat(self.OFF_SCREEN_POINT)
            
        })
        UIView.animate(withDuration: 1.0, delay: 0.7, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.forgotPasswordButton.center.x += CGFloat(self.OFF_SCREEN_POINT)
            
        })
        UIView.animate(withDuration: 1.0, delay: 0.7, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.createAccountButton.center.x += CGFloat(self.OFF_SCREEN_POINT)
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateBackgroundColor() {
        
        // Update iterator
        if colorIterator == backgroundColorsArray.count-1 {
            colorIterator = 0
        }
        else {
            colorIterator += 1
        }
        
        // Animate background color transition. Recursivley call the 
        // function infinitely.
        UIView.animate(withDuration: 1.5, delay: 0, options: .allowUserInteraction, animations: {
            self.view.backgroundColor = self.backgroundColorsArray[self.colorIterator]
        }) { (Bool) in
            self.animateBackgroundColor()
        }
    }
}
