//
//  ContactsViewController.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 1/2/17.
//  Copyright © 2017 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsTableCell", for: indexPath)
        
        cell.textLabel?.text = "I WAS HERE"
        
        return cell
    }
}
