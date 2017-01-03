//
//  ContactsViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FetchDataDelegate {

    @IBOutlet weak var contactsTableView: UITableView!
    var contacts = [Contact]()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseDatabaseHelper.instance.delegate = self
        FirebaseDatabaseHelper.instance.getContacts()
     
        // Change size of slide out menu
        self.revealViewController().rearViewRevealWidth = 200
        
        if revealViewController() != nil {
            self.menuButton.target = revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
    }

    func dataReceived(contacts: [Contact]) {
        self.contacts = contacts
        self.contactsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsTableCell", for: indexPath) as! ContactTableViewCell
        
        cell.contactUsername.text = contacts[indexPath.row].username
        //cell.contactProfileImage.image = contacts[indexPath.row].profileImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chatWithContactSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if sender == chatWithContactSegue 
        // Put Usersname as tite of chat box
        // And open previous chat history with this person
    }
}
