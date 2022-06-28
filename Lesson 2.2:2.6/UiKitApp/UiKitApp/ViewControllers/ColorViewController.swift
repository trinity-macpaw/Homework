//
//  ColorViewController.swift
//  UiKitApp
//
//  Created by trinity on 26.06.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.settingsDelegate = self
        
        settingsVC.color = view.backgroundColor
    }
}

// MARK: - Extensions
extension ColorViewController: SettingsViewControllerDelegate {
    func updatedColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
