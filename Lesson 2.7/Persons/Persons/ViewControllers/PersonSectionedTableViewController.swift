//
//  PersonSectionedTableViewController.swift
//  Persons
//
//  Created by trinity on 11.07.2022.
//

import UIKit

class PersonSectionedTableViewController: UITableViewController {
    
    private var contacts = DataManager.contacts
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let contact = contacts[indexPath.section]
        
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = contact.phone
        } else {
            content.image = UIImage(systemName: "tray")
            content.text = contact.email
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let contact = contacts[section]
        return contact.fullName
    }
}
