//
//  ViewController.swift
//  UiKitApp
//
//  Created by trinity on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redCounterLabel: UILabel!
    @IBOutlet var greenCounterLabel: UILabel!
    @IBOutlet var blueCounterLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Private Properties
    private let formatter = NumberFormatter()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFormatter()
        setupUI()
        setupDefaultColor()
    }
    
    // MARK: - IB Actions
    @IBAction func changeRedSlider() {
        redCounterLabel.text = formatter.string(from: redSlider.value as NSNumber)
        updateColorView()
    }
    
    @IBAction func changeGreenSlider() {
        greenCounterLabel.text = formatter.string(from: greenSlider.value as NSNumber)
        updateColorView()
    }
    
    @IBAction func changeBlueSlider() {
        blueCounterLabel.text = formatter.string(from: blueSlider.value as NSNumber)
        updateColorView()
    }
    
    // MARK: - Private Methods
    private func setupFormatter() {
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
    }
    
    private func setupUI() {
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
    }
    
    private func setupDefaultColor() {
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        redCounterLabel.text = formatter.string(from: redSlider.value as NSNumber)
        greenCounterLabel.text = formatter.string(from: greenSlider.value as NSNumber)
        blueCounterLabel.text = formatter.string(from: blueSlider.value as NSNumber)
        
        updateColorView()
    }
    
    private func updateColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

