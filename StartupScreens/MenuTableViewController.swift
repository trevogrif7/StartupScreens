//
//  MenuTableViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/27/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var menuItemNameArray = [String]()
    var menuIconArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuItemNameArray = ["Home", "Messages", "Settings"]
        menuIconArray = [UIImage(named: "background1")!, UIImage(named: "background2")!, UIImage(named: "background3")!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItemNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        // Configure cell
        cell.menuIcon.image = menuIconArray[indexPath.row]
        cell.menuItemName.text = menuItemNameArray[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        
        } else {
            print("ERROR: THIS SHOULD NEVER HAPPEN. SEE MENUTABLEVEIWCONTROLLER")
        }

        
    }
    
        

}
