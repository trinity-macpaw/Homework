//
//  HobbyViewController.swift
//  LoginView
//
//  Created by trinity on 07.06.2022.
//

import UIKit

class HobbyViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var hobbyLabel: UILabel!
    
    // MARK: - Public Properties
    var hobbies: [String]?
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        hobbyLabel.text = hobbies?
            .map { item in "• \(item)" }
            .joined(separator: "\n")
    }
}
