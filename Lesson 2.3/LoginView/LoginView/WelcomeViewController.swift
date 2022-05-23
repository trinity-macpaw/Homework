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
    var userName: String?
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome " + (userName ?? "Unknown user")
    }
}
