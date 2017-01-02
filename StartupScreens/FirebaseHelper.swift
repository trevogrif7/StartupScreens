//
//  FirebaseHelper.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/1/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import Firebase


class FirebaseHelper {

    // Singleton instance of FirebaseHelper class
    static var firebaseHelper = FirebaseHelper()

    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

    func createAccountWithEmail(emailAddress: String, password: String, targetVC: UIViewController) {
        
        // Create account
        FIRAuth.auth()?.createUser(withEmail: emailAddress, password: password
            , completion: { (user, error) in
                
                // If acount creation didn't work show error as alert
                if error != nil {
                    print("Error encountered when attempting to create account")

                    let errorAlert = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    errorAlert.addAction(self.alertAction)
                    
                    targetVC.present(errorAlert, animated: true, completion: nil)
                    
                }
                else {
                    // Account created
                    print("Account was created")
                    
                    self.signInWithEmailOrUsername(emailAddressOrUsername: emailAddress , password: password, targetVC: targetVC)
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
                        
                        errorAlert.addAction(self.alertAction)
                        
                        targetVC.present(errorAlert, animated: true, completion: nil)
                    }
                    else {
                        print("You were signed in correctly")
                        
                        // Segue to next page of app
                        targetVC.performSegue(withIdentifier: "signedInSegue", sender: self)
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
    
    func signInAnonymously (target : UIViewController) {
        
    }
    
}
