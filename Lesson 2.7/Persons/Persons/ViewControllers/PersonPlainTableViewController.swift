//
//  PersonPlainTableViewController.swift
//  Persons
//
//  Created by trinity on 10.07.2022.
//

import UIKit

class PersonPlainTableViewController: UITableViewController {
    
    private var contacts = DataManager.contacts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let contact = contacts[indexPath.row]
        
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fullInfoVC = segue.destination as? FullInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let contact = contacts[indexPath.row]
        fullInfoVC.contact = contact
    }
    
}

