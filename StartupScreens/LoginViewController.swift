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

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var dimBackgroundView: UIView!
    
    // Create Account View's IBoutlets
    @IBOutlet var createAccountView: UIView!
    @IBOutlet weak var createAccountBackgroundView: UIView!
    @IBOutlet weak var createAccountTopView: UIView!
    @IBOutlet weak var createAccountReEnterPasswordTextField: UITextField!
    @IBOutlet weak var createAccountPasswordTextField: UITextField!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    @IBOutlet weak var createAccountLastNameTextField: UITextField!
    @IBOutlet weak var createAccountFirstNameTextField: UITextField!
    @IBOutlet weak var createAccountUsernameTextField: UITextField!
    @IBOutlet weak var createAccountProfileImage: UIImageView!
    @IBOutlet weak var createAccountCancelButton: UIButton!
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var createAccountSaveButton: UIButton!

    let grayBorderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0).cgColor
    
    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

    // Variables to control background animation
    //var backgroundColorsArray = [UIColor]()
    //var colorIterator  = 0
    
    // Used to get images
    let imagePickerController = UIImagePickerController()
    
    // Variables used to help animate items on view
    let OFF_SCREEN_POINT = 800.0
    var initialLoadHasOccured = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Delegates
        imagePickerController.delegate = self
        
        // Initialize attributes
        initialLoadHasOccured = false
        
        signInButton.layer.borderWidth = 1.0
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
        
        self.emailTextField.font = UIFont(name: "GillSans", size: 20)
        self.passwordTextField.font = UIFont(name: "GillSans", size: 20)
        self.signInButton.titleLabel?.font = UIFont(name: "GillSans", size: 20)
        self.forgotPasswordButton.titleLabel?.font = UIFont(name: "GillSans", size: 15)
        self.createAccountButton.titleLabel?.font = UIFont(name: "GillSans", size: 15)

        
        //// Set up create account popup view ////
        
        // Format text fields
        createAccountUsernameTextField.layer.borderWidth = 1.0
        createAccountEmailTextField.layer.borderWidth = 1.0
        createAccountFirstNameTextField.layer.borderWidth = 1.0
        createAccountLastNameTextField.layer.borderWidth = 1.0
        createAccountPasswordTextField.layer.borderWidth = 1.0
        createAccountReEnterPasswordTextField.layer.borderWidth = 1.0
        
        createAccountUsernameTextField.layer.borderColor = grayBorderColor
        createAccountEmailTextField.layer.borderColor = grayBorderColor
        createAccountFirstNameTextField.layer.borderColor = grayBorderColor
        createAccountLastNameTextField.layer.borderColor = grayBorderColor
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
        
        // Create background color array for color changing animation
        //self.backgroundColorsArray = [
        //    UIColor(red: 00/255, green: 112/255, blue: 190/255, alpha: 1.0),
        //    UIColor(red: 00/255, green: 75/255, blue: 100/255, alpha: 1.0)]
        
        // Constantly shift background color
        //animateBackgroundColor()
        
        self.view.backgroundColor = UIColor(red: 00/255, green: 112/255, blue: 190/255, alpha: 1.0)
        
        // Firebase functionality
        
        // Check to see if this is a known user
        let user = FIRAuth.auth()?.currentUser
        
        if user != nil {
            self.emailTextField.text = user?.email
            
            // Pull in all data needed from Firebase
        }
        else {
            
        }
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

        if self.initialLoadHasOccured == false {
            
            // Only execute animation when viewcontroller is first loaded
            self.initialLoadHasOccured = true
            
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func animateBackgroundColor() {
//        
//        // Update iterator
//        if colorIterator == backgroundColorsArray.count-1 {
//            colorIterator = 0
//        }
//        else {
//            colorIterator += 1
//        }
//        
//        // Animate background color transition. Recursivley call the
//        // function infinitely.
//        UIView.animate(withDuration: 4.0, delay: 0, options: [.allowUserInteraction], animations: {
//            self.view.backgroundColor = self.backgroundColorsArray[self.colorIterator]
//        }, completion: { (complete)  in
//            self.animateBackgroundColor()
//        })
//    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        // Disable buttons on view controller
        self.emailTextField.isEnabled = false
        self.passwordTextField.isEnabled = false
        self.signInButton.isEnabled = false
        self.forgotPasswordButton.isEnabled = false
        self.createAccountButton.isEnabled = false
        
        // Make cursor move to username text field
        self.createAccountUsernameTextField.becomeFirstResponder()
        
        // Stop the animation in the background
        //self.view.layer.removeAllAnimations()
        
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
        self.createAccountFirstNameTextField.text = ""
        self.createAccountLastNameTextField.text = ""
        self.createAccountPasswordTextField.text = ""
        self.createAccountReEnterPasswordTextField.text = ""
        self.createAccountProfileImage.image = UIImage(named: "defaultProfilePicture")
        self.createAccountProfileImage.contentMode = .scaleAspectFit

        // Enable buttons on view controller
        self.emailTextField.isEnabled = true
        self.passwordTextField.isEnabled = true
        self.signInButton.isEnabled = true
        self.forgotPasswordButton.isEnabled = true
        self.createAccountButton.isEnabled = true
        
        // Make cursor move to username text field
        self.emailTextField.becomeFirstResponder()
        
        // Restart the animation in the background
        //self.animateBackgroundColor()
        
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
        var firstNameBlank = false
        var lastNameBlank = false
        var emailBlank = false
        var passwordBlank = false
        var reEnterPasswordBlank = false
        
        createAccountUsernameTextField.layer.borderColor = grayBorderColor
        createAccountEmailTextField.layer.borderColor = grayBorderColor
        createAccountFirstNameTextField.layer.borderColor = grayBorderColor
        createAccountLastNameTextField.layer.borderColor = grayBorderColor
        createAccountPasswordTextField.layer.borderColor = grayBorderColor
        createAccountReEnterPasswordTextField.layer.borderColor = grayBorderColor

        // Make sure all fields are filled out and mark those that aren't by changing border color to red
        if createAccountUsernameTextField.text == "" {
            usernameBlank = true
            createAccountUsernameTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if createAccountFirstNameTextField.text == "" {
            
            firstNameBlank = true
            createAccountFirstNameTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if createAccountLastNameTextField.text == "" {
            
            lastNameBlank = true
            createAccountLastNameTextField.layer.borderColor = UIColor.red.cgColor
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
            firstNameBlank == true ||
            lastNameBlank == true  ||
            emailBlank == true     ||
            passwordBlank == true  ||
            reEnterPasswordBlank == true {
            
            let fieldLeftBlankAlert = UIAlertController(title: "Alert", message: "Please fill in all fields", preferredStyle: .alert)

            fieldLeftBlankAlert.addAction(alertAction)
            
            self.present(fieldLeftBlankAlert, animated: true, completion: nil)
            
        }
        else {
        
            // Check to see that passwords match
            if createAccountPasswordTextField.text == createAccountReEnterPasswordTextField.text {
                
                // Create account
                FIRAuth.auth()?.createUser(withEmail: createAccountEmailTextField.text!, password: createAccountPasswordTextField.text!
                    , completion: { (user, error) in

                        // If acount creation didn't work show error as alert
                        if error != nil {
                            
                            let errorAlert = UIAlertController(title: "Try Again", message: error?.localizedDescription, preferredStyle: .alert)
                            
                            errorAlert.addAction(self.alertAction)
                            
                            self.present(errorAlert, animated: true, completion: nil)
                        }
                        else {
                            // Account created
                            print("Account was created")
                            
                            // Update email and password fields
                            self.emailTextField.text = self.createAccountEmailTextField.text
                            self.passwordTextField.text = self.createAccountPasswordTextField.text
                            
                            // Sign the user in
                            self.signIn()
                        }
                })
            }
            else {
                // Passwords don't match, show alert
                let passwordMisMatchAlert = UIAlertController(title: "Alert", message: "Passwords must match", preferredStyle: .alert)
                
                passwordMisMatchAlert.addAction(alertAction)
                
                self.present(passwordMisMatchAlert, animated: true, completion: nil)
            } // Password matching check
        } // Blank field check
        
    }
    
    func signIn() {
        
        // Sign in to account
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!
            , completion: { (user, error) in
                
                // If sign in didn't work, show error as alert
                if error != nil {
                    let errorAlert = UIAlertController(title: "Try Again", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    errorAlert.addAction(self.alertAction)
                    
                    self.present(errorAlert, animated: true, completion: nil)
                }
                else {
                    print("You were signed in correctly")
                    
                    // TODO: Segue to next page of app
                }
        })
    }
    
    func signOut () {
        // Sign out of account
        try! FIRAuth.auth()?.signOut()
    }

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let fieldLeftBlankAlert = UIAlertController(title: "Alert", message: "Please enter your email and password", preferredStyle: .alert)
            
            fieldLeftBlankAlert.addAction(self.alertAction)
            
            self.present(fieldLeftBlankAlert, animated: true, completion: nil)

        }
        else {
            self.signIn()
        }
    }
    
    @IBAction func profileImageTapped(_ sender: UITapGestureRecognizer) {

        // If we have access to the camera but not the photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) && !(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            self.takePicture()
   
        // If we have access to the photo library but not the camera
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            self.openPhotoLibrary()
        
        // If we have access to both the camera and photo library
        } else if UIImagePickerController.isSourceTypeAvailable(.camera) && UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let alertController = UIAlertController(title: "Please Select", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let libraryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: {UIAlertAction in self.openPhotoLibrary()})
            let cameraAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default, handler: {UIAlertAction in self.takePicture()})
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(libraryAction)
            alertController.addAction(cameraAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)

        // If we don't have access to either source of images
        } else {
            let alertController = UIAlertController(title: "Alert", message: "Your device does not support the camera or photo library", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
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
    
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss image picker
        dismiss(animated: true, completion: nil)
        
        // Move cursor back to username test box
        self.createAccountUsernameTextField.becomeFirstResponder()
    }

    
    // Helper funcitons for accessing the camera and photo library
    func takePicture() {
        
        // Select Camera as the source
        imagePickerController.sourceType = .camera
        
        // Adding this line allows video too
        //imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
        
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func openPhotoLibrary() {
        
        // Select Photo Library as the source
        imagePickerController.sourceType = .photoLibrary

        // Adding this line allows video too
        //imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
    }

}
