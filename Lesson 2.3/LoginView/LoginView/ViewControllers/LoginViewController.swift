//
//  ViewController.swift
//  LoginView
//
//  Created by trinity on 20.05.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let password = "1234"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.autocorrectionType = .no
        userNameTF.spellCheckingType = .no
        userNameTF.delegate = self
        userNameTF.returnKeyType = .next
        
        passwordTF.isSecureTextEntry = true
        passwordTF.delegate = self
        passwordTF.returnKeyType = .done
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    // MARK: - IB Actions
    @IBAction func forgotUserNameTapped() {
        showAlert(title: "Oops!", message: "Your name is \(userName) 🤩")
    }
    
    @IBAction func forgotPasswordTapped() {
        showAlert(title: "Oops!", message: "Your password is \(password) 🤫")
    }
    
    @IBAction func logInButtonTapped() {
        if userNameTF.text == userName && passwordTF.text == password {
            performSegue(withIdentifier: "goToWelcome", sender: nil)
        } else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
            passwordTF.text = nil
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: - UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInButtonTapped()
        }
        
        return true
    }
    
    // MARK: - Private Methods
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
}
