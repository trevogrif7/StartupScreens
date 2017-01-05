//
//  LoginViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/17/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var dividingLineView: UIView!

    @IBOutlet weak var emailOrUsernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var dimBackgroundView: UIView!
    
    // Alternate Login method buttons
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var facebookSignInButton: UIButton!
    @IBOutlet weak var twitterSignInButton: UIButton!
    
    
    // Create Account View's IBoutlets
    @IBOutlet var createAccountView: UIView!
    @IBOutlet weak var createAccountBackgroundView: UIView!
    @IBOutlet weak var createAccountTopView: UIView!
    @IBOutlet weak var createAccountReEnterPasswordTextField: UITextField!
    @IBOutlet weak var createAccountPasswordTextField: UITextField!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    @IBOutlet weak var createAccountUsernameTextField: UITextField!
    @IBOutlet weak var createAccountProfileImage: UIImageView!
    @IBOutlet weak var createAccountCancelButton: UIButton!
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var createAccountSaveButton: UIButton!

    let grayBorderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0).cgColor
    
    // Used to get images
    let imagePickerController = UIImagePickerController()
    
    // Variables used to help animate items on view
    let OFF_SCREEN_POINT = 800.0
    var initialLoadHasOccured = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove back button
        self.navigationItem.hidesBackButton = true
        
        // Initialize Delegates
        imagePickerController.delegate = self
        
        // Initialize attributes
        initialLoadHasOccured = false
        
        signInButton.layer.borderWidth = 1.0
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        self.emailOrUsernameTextField.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.passwordTextField.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.signInButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.forgotPasswordButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        self.createAccountButton.center.x -= CGFloat(OFF_SCREEN_POINT)
        
        self.emailOrUsernameTextField.isHidden = true
        self.passwordTextField.isHidden = true
        self.signInButton.isHidden = true
        self.forgotPasswordButton.isHidden = true
        self.createAccountButton.isHidden = true
        
        self.emailOrUsernameTextField.font = UIFont(name: "GillSans", size: 20)
        self.passwordTextField.font = UIFont(name: "GillSans", size: 20)
        self.signInButton.titleLabel?.font = UIFont(name: "GillSans", size: 20)
        self.forgotPasswordButton.titleLabel?.font = UIFont(name: "GillSans", size: 15)
        self.createAccountButton.titleLabel?.font = UIFont(name: "GillSans", size: 15)

        
        //// Set up create account popup view ////
        
        // Format text fields
        createAccountUsernameTextField.layer.borderWidth = 1.0
        createAccountEmailTextField.layer.borderWidth = 1.0
        createAccountPasswordTextField.layer.borderWidth = 1.0
        createAccountReEnterPasswordTextField.layer.borderWidth = 1.0
        
        createAccountUsernameTextField.layer.borderColor = grayBorderColor
        createAccountEmailTextField.layer.borderColor = grayBorderColor
        createAccountPasswordTextField.layer.borderColor = grayBorderColor
        createAccountReEnterPasswordTextField.layer.borderColor = grayBorderColor
        
        // Format label and buttons
        createAccountLabel.font = UIFont(name: "GillSans", size: 18)
        createAccountCancelButton.titleLabel?.font = UIFont(name: "GillSans", size: 14)
        createAccountSaveButton.titleLabel?.font = UIFont(name: "GillSans", size: 14)

        
        // Make profile image round
        self.createAccountProfileImage.layer.masksToBounds = true
        self.createAccountProfileImage.layer.cornerRadius = self.createAccountProfileImage.frame.height/2
        
        // Add shadow to top view
        self.createAccountTopView.layer.shadowColor = UIColor.black.cgColor
        self.createAccountTopView.layer.masksToBounds = false
        self.createAccountTopView.layer.shadowOpacity = 0.8
        self.createAccountTopView.layer.shadowRadius = 10
        self.createAccountTopView.layer.shadowOffset = CGSize(width: -5.0, height: 3.0)
        
        self.view.backgroundColor = UIColor(red: 00/255, green: 112/255, blue: 190/255, alpha: 1.0)
        
        // Check to see if user is logged in
        if FirebaseAuthHelper.sharedInstance.isLoggedIn() {
            
            // Pull in all data needed from Firebase
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        
        // Set email text field as first responders so that the user can immediately type their email address
        self.emailOrUsernameTextField.becomeFirstResponder()

        // Un-hide UI elements
        self.emailOrUsernameTextField.isHidden = false
        self.passwordTextField.isHidden = false
        self.signInButton.isHidden = false
        self.forgotPasswordButton.isHidden = false
        self.createAccountButton.isHidden = false

        if self.initialLoadHasOccured == false {
            
            // Only execute animation when viewcontroller is first loaded
            self.initialLoadHasOccured = true
            
            UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.emailOrUsernameTextField.center.x += CGFloat(self.OFF_SCREEN_POINT)
                
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        // Disable buttons on view controller
        self.emailOrUsernameTextField.isEnabled = false
        self.passwordTextField.isEnabled = false
        self.signInButton.isEnabled = false
        self.forgotPasswordButton.isEnabled = false
        self.createAccountButton.isEnabled = false
        
        // Make cursor move to username text field
        self.createAccountUsernameTextField.becomeFirstResponder()
        
        // Add the create account view and set its position
        self.view.addSubview(createAccountView)
        createAccountView.center = CGPoint(x: self.view.center.x, y: self.view.center.y-125)
        
        // Set up the transform property
        createAccountView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        
        // Make sure the view isn't visible yet
        createAccountView.alpha = 0
        
        // Animate presentation of create account view
        UIView.animate(withDuration: 0.3) {
            
            // Dim background
            self.dimBackgroundView.alpha = 0.5

            // Make view visible and use the transform to create additional scale effect
            self.createAccountView.alpha = 1.0
            self.createAccountView.transform = CGAffineTransform.identity
            
        }
    }
    
    @IBAction func createAccountCancelButtonPressed(_ sender: UIButton) {

        // Clear the fields on the create account popup
        self.createAccountUsernameTextField.text = ""
        self.createAccountEmailTextField.text = ""
        self.createAccountPasswordTextField.text = ""
        self.createAccountReEnterPasswordTextField.text = ""
        self.createAccountProfileImage.image = UIImage(named: "defaultProfilePicture")
        self.createAccountProfileImage.contentMode = .scaleAspectFit

        // Enable buttons on view controller
        self.emailOrUsernameTextField.isEnabled = true
        self.passwordTextField.isEnabled = true
        self.signInButton.isEnabled = true
        self.forgotPasswordButton.isEnabled = true
        self.createAccountButton.isEnabled = true
        
        // Make cursor move to username text field
        self.emailOrUsernameTextField.becomeFirstResponder()
        
        // Animate dismissal of create account view
        UIView.animate(withDuration: 0.3, animations: {
            self.createAccountView.alpha = 0
            self.createAccountView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)

            // Un-Dim background
            self.dimBackgroundView.alpha = 0
            
        }) { (Bool) in
            self.createAccountView.removeFromSuperview()
        }
    }
    
    @IBAction func createAccountSaveButtonPressed(_ sender: UIButton) {
        
        var usernameBlank = false
        var emailBlank = false
        var passwordBlank = false
        var reEnterPasswordBlank = false
        
        self.createAccountUsernameTextField.layer.borderColor = grayBorderColor
        self.createAccountEmailTextField.layer.borderColor = grayBorderColor
        self.createAccountPasswordTextField.layer.borderColor = grayBorderColor
        self.createAccountReEnterPasswordTextField.layer.borderColor = grayBorderColor

        // Make sure all fields are filled out and mark those that aren't by changing border color to red
        if createAccountUsernameTextField.text == "" {
            usernameBlank = true
            createAccountUsernameTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if createAccountEmailTextField.text == "" {
            
            emailBlank = true
            createAccountEmailTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if createAccountPasswordTextField.text == "" {
            
            passwordBlank = true
            createAccountPasswordTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if createAccountReEnterPasswordTextField.text == "" {
            
            reEnterPasswordBlank = true
            createAccountReEnterPasswordTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        // Alert user that not all fields have been filled out
        if usernameBlank == true   ||
            emailBlank == true     ||
            passwordBlank == true  ||
            reEnterPasswordBlank == true {
            
            let fieldLeftBlankAlert = UIAlertController(title: "Alert", message: "Please fill in all fields", preferredStyle: .alert)

            fieldLeftBlankAlert.addAction(Helper.sharedInstance.alertAction_OK)
            
            self.present(fieldLeftBlankAlert, animated: true, completion: nil)
            
        } else {
        
            // Check to see that passwords match
            if createAccountPasswordTextField.text == createAccountReEnterPasswordTextField.text {
                
                // Create account
                FirebaseAuthHelper.sharedInstance.createAccountWithEmail(username: createAccountUsernameTextField.text!, emailAddress: createAccountEmailTextField.text!, profileImage: createAccountProfileImage.image, password: createAccountPasswordTextField.text!, targetVC: self)

            } else {
                // Passwords don't match, show alert
                let passwordMisMatchAlert = UIAlertController(title: "Alert", message: "Passwords must match", preferredStyle: .alert)
                
                passwordMisMatchAlert.addAction(Helper.sharedInstance.alertAction_OK)
                
                self.present(passwordMisMatchAlert, animated: true, completion: nil)
            } // Password matching check
            
        } // Blank field check
        
    } // CreateAccountSavedButtonPressed
        
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        if emailOrUsernameTextField.text == "" || passwordTextField.text == "" {
            let fieldLeftBlankAlert = UIAlertController(title: "Alert", message: "Please enter your email and password", preferredStyle: .alert)
            
            fieldLeftBlankAlert.addAction(Helper.sharedInstance.alertAction_OK)
            
            self.present(fieldLeftBlankAlert, animated: true, completion: nil)

        }
        else {
            // Sign in to account
            FirebaseAuthHelper.sharedInstance.signInWithEmailOrUsername(emailAddressOrUsername: self.emailOrUsernameTextField.text!, password: self.passwordTextField.text!, targetVC: self)
        }
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: Any) {
        print("login with google button was pressed")
    }
    
    @IBAction func facebookSignInButtonPressed(_ sender: Any) {
        print("login with facebook button was pressed")
    }
    
    @IBAction func twitterSignInButtonPressed(_ sender: Any) {
        print("login with twitter button was pressed")
    }
    
    @IBAction func profileImageTapped(_ sender: UITapGestureRecognizer) {
        
        Helper.sharedInstance.selectVisualMedia(target: self, imagePicker: imagePickerController, includeVideo: false)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        // Get image and set as profile picture
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        createAccountProfileImage.contentMode = .scaleToFill
        createAccountProfileImage.image = image

        // Dismiss image picker
        dismiss(animated:true, completion: nil)
        
        // Move cursor back to username test box
        self.createAccountUsernameTextField.becomeFirstResponder()
    }
    
   
    // Dismiss image picker when cancel is pressed and no image is selected
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss image picker
        dismiss(animated: true, completion: nil)
        
        // Move cursor back to username test box
        self.createAccountUsernameTextField.becomeFirstResponder()
    }

}
