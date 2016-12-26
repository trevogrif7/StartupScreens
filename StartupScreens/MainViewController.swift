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

        menuButton.target = revealViewController()
        
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
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
    }
}
