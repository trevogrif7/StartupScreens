//
//  CreateAccountViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/19/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!
            , completion: { (user, error) in
                
                if error != nil {
                    // Seee GOCR app for potential errors and remedies
  
                    self.login()
                }
                else {
                    // Account Created
                    self.login()
                }
        })
    }
    
    func login() {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!
            , completion: { (user, error) in
                
                if error != nil {
                    print("login didn't work")
                    // Seee GOCR app for potential errors and remedies
                }
                else {
                    print("login worked correctly")
                }
        })
    }
}
