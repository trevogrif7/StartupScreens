//
//  MenuViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/1/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    var menuItemNameArray = [String]()
    var menuIconArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
        
        menuItemNameArray = ["Home", "Messages", "Profile", "Settings"]
        menuIconArray = [UIImage(named: "background1")!, UIImage(named: "background2")!, UIImage(named: "background3")!, UIImage(named: "background4")!]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItemNameArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        // Configure cell
        cell.menuIcon.image = menuIconArray[indexPath.row]
        cell.menuItemName.text = menuItemNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Programmatically tell the menu what selection navigates where
        
        let revealVC: SWRevealViewController = self.revealViewController()
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.menuItemName.text == "Home" {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            let newFrontVC = UINavigationController.init(rootViewController: destinationVC)
            
            revealVC.pushFrontViewController(newFrontVC, animated: true)
            
        } else if cell.menuItemName.text == "Messages" {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
            let newFrontVC = UINavigationController.init(rootViewController: destinationVC)
            
            revealVC.pushFrontViewController(newFrontVC, animated: true)
            
        } else if cell.menuItemName.text == "Settings" {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            let newFrontVC = UINavigationController.init(rootViewController: destinationVC)
            
            revealVC.pushFrontViewController(newFrontVC, animated: true)
            
        } else if cell.menuItemName.text == "Profile" {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            let newFrontVC = UINavigationController.init(rootViewController: destinationVC)
            
            revealVC.pushFrontViewController(newFrontVC, animated: true)
        }
        
        else {
            print("ERROR: THIS SHOULD NEVER HAPPEN. SEE MENU VEIW CONTROLLER")
        }
        
    }

    
}
