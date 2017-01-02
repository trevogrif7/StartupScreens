//
//  ProfileViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/1/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Change size of slide out menu
        self.revealViewController().rearViewRevealWidth = 200
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
