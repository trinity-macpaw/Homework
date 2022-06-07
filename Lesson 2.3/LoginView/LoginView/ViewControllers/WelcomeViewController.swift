//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by trinity on 22.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User?
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            welcomeLabel.text = "Welcome, \(user.person.name) \(user.person.surname)"
        } else {
            welcomeLabel.text = "Welcome, Unknown user"
        }
    }
}
