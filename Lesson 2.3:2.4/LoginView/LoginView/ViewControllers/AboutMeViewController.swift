//
//  AboutMeViewController.swift
//  LoginView
//
//  Created by trinity on 07.06.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    // MARK: - Public Properties
    var person: Person?
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = person?.name
        surnameLabel.text = person?.surname
        ageLabel.text = person.map { person in
            String(person.age)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hobbyVC = segue.destination as? HobbyViewController else { return }
        hobbyVC.hobbies = person?.hobbies
    }

}
