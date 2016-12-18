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
    
    // Variables to control background animation
    var backgroundColorsArray = [UIColor]()
    var colorIterator  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.layer.borderWidth = 0.5
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        self.emailTextField.becomeFirstResponder()
        
        backgroundColorsArray = [
            UIColor(red: 00/255, green: 122/255, blue: 215/255, alpha: 0.8),
            UIColor(red: 00/255, green: 102/255, blue: 145/255, alpha: 1.0)]

        animateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateBackgroundColor() {
        
        // Managa iterator
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
