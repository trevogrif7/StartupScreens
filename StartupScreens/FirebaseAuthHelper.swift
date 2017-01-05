//
//  FirebaseAuthHelper.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import FirebaseAuth


class FirebaseAuthHelper {
    
    // Singleton instance of FirebaseAuthHelper class
    static let sharedInstance = FirebaseAuthHelper()
    
    // Limit the create of these objects to this one
    private init () {}
    
    func createAccountWithEmail(username: String, emailAddress: String, profileImage: UIImage?, password: String, targetVC: UIViewController) {
        
        // Create account
        FIRAuth.auth()?.createUser(withEmail: emailAddress, password: password
            , completion: { (user, error) in
                
                // If acount creation didn't work show error as alert
                if error != nil {
                    print("Error encountered when attempting to create account")
                    
                    let errorAlert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    errorAlert.addAction(Helper.sharedInstance.alertAction_OK)
                    
                    targetVC.present(errorAlert, animated: true, completion: nil)
                    
                }
                else {
                    
                    if user?.uid != nil {
                        // Account created
                        print("Account was created")
                        
                        // Create user in database
                        FirebaseDatabaseHelper.sharedInstance.saveUser(UID: user!.uid, username: username, email: emailAddress, password: password)
                        
                        self.signInWithEmailOrUsername(emailAddressOrUsername: emailAddress , password: password, targetVC: targetVC)
                    }
                }
        })
        
    }
    
    func signInWithEmailOrUsername(emailAddressOrUsername: String, password: String, targetVC: UIViewController) {
        
        
        //if emailAddress {
        // Sign in to account with email address
        FIRAuth.auth()?.signIn(withEmail: emailAddressOrUsername, password: password
            , completion: { (user, error) in
                
                // If sign in didn't work, show error as alert
                if error != nil {
                    print("Error encountered when attempting to sign in")
                    let errorAlert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    errorAlert.addAction(Helper.sharedInstance.alertAction_OK)
                    
                    targetVC.present(errorAlert, animated: true, completion: nil)
                }
                else {
                    print("You were signed in correctly")
                    
                    // Segue to next page of app
                    targetVC.performSegue(withIdentifier: "signedInSegue", sender: nil)
                }
        })
        //} else {
        // Retrieve email address using username then sign in
        //}
        
    }
    
    func signInWithGoogle () {
        
    }
    
    func signInWithFacebook () {
        
    }
    
    func signInWithTwitter () {
        
    }
    
    
    // Do we need this functionality?
    func signInAnonymously(/*emailAddressOrUsername: String,*/ targetVC : UIViewController) {
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            
            if error != nil {
                print("Error encountered when attempting to sign in anonymously")
                let errorAlert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                
                errorAlert.addAction(Helper.sharedInstance.alertAction_OK)
                
                targetVC.present(errorAlert, animated: true, completion: nil)
            } else {
                print("You were signed in anonymously")
                
                // Save user name from emailAddressOrUsername
                
                
                // Go Segue to appropriate view
                targetVC.performSegue(withIdentifier: "signedInSegue", sender: nil)
            }
        })
    }
    
    func isLoggedIn() -> Bool {
        // Check to see if this user is logged in
        if FIRAuth.auth()?.currentUser != nil {
            
            return true
        }
        else {
            
            return false
        }
        
    }
    
    func signOut() /*-> Bool*/ {
        // Sign out of account if currently signed in
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                //return true
            } catch {
                //return false
            }
        }
        
        //return true
    }
    
    
}
