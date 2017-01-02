//
//  MainViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/25/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove back button (Doesn't seem to work on this viewcontroller)
        //self.navigationItem.hidesBackButton = true


        // Change size of slide out menu
        self.revealViewController().rearViewRevealWidth = 175
        
        if revealViewController() != nil {
            self.menuButton.target = revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        self.signOut()
    }

    func signOut () {
        // Sign out of account
        try! FIRAuth.auth()?.signOut()
        
        // Where should we transition to once we log out?
        //self.performSegue(withIdentifier: "logoutSegue", sender: self)
     
    }
}
