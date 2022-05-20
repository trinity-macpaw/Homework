//
//  ViewController.swift
//  LoginView
//
//  Created by trinity on 20.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func forgotUserNameTapped() {
        let alert = UIAlertController(
            title: "Oops!",
            message: "Your name is User \u{1F929}",
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
}
