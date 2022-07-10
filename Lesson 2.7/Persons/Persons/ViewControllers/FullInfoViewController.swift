//
//  FullInfoViewController.swift
//  Persons
//
//  Created by trinity on 10.07.2022.
//

import UIKit

class FullInfoViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var contact: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let contact = contact else { return }
        
        navigationItem.title = contact.fullName
        phoneLabel.text = "Phone: " + contact.phone
        emailLabel.text = "Email: " + contact.email
    }
}
