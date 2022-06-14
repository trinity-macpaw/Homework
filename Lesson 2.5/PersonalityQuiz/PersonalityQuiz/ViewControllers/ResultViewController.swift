//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    // MARK: - Public Properties
    var answers: [Answer]?

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        setAnimal()
    }
    
    // MARK: - Private Methods
    private func setAnimal() {
        guard let animal = defineAnimal(answers: answers) else { return }
        animalLabel.text = "Вы - \(animal.rawValue)"
        animalDescriptionLabel.text = animal.definition
    }
    
    private func defineAnimal(answers: [Answer]?) -> Animal? {
        guard let answers = answers else { return nil}
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0

        for answer in answers {
            switch answer.animal {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        if dog >= cat && dog >= rabbit && dog >= turtle {
            return .dog
        } else if cat >= dog && cat >= rabbit && cat >= turtle {
            return .cat
        } else if rabbit >= dog && rabbit >= cat && rabbit >= turtle {
            return .rabbit
        } else {
            return .turtle
        }
    }
}
