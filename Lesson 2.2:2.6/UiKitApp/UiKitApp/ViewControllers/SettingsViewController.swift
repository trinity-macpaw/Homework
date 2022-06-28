//
//  ViewController.swift
//  UiKitApp
//
//  Created by trinity on 12.05.2022.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redCounterLabel: UILabel!
    @IBOutlet var greenCounterLabel: UILabel!
    @IBOutlet var blueCounterLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redCounterTextField: UITextField!
    @IBOutlet var greenCounterTextField: UITextField!
    @IBOutlet var blueCounterTextField: UITextField!
    
    // MARK: - Public Properties
    var settingsDelegate: SettingsViewControllerDelegate?
    var color: UIColor?
    
    // MARK: - Formatter
    private let formatter = NumberFormatter()
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redCounterTextField.delegate = self
        greenCounterTextField.delegate = self
        blueCounterTextField.delegate = self
        
        setupFormatter()
        setupUI()
        setupKeyboardForTextFields()
        setupColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func changeRedSlider() {
        fillValue(from: redSlider, for: redCounterLabel, and: redCounterTextField)
        
        updateColorView()
    }
    
    @IBAction func changeGreenSlider() {
        fillValue(from: greenSlider, for: greenCounterLabel, and: greenCounterTextField)
        
        updateColorView()
    }
    
    @IBAction func changeBlueSlider() {
        fillValue(from: blueSlider, for: blueCounterLabel, and: blueCounterTextField)
        
        updateColorView()
    }
    
    @IBAction func doneButtonTapped() {
        guard let color = colorView.backgroundColor else { return }
        settingsDelegate?.updatedColor(color)
        
        dismiss(animated: true)
    }
    
    // MARK: - Delegate Methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard
            let text = textField.text,
            let number = Float(text),
            number >= 0 && number <= 1
        else {
            showAlert(title: "Oops", message: "You've entered a wrong number. Enter only numbers from 0 to 1", textField: textField)
            return
        }
        
        switch textField {
        case redCounterTextField:
            redSlider.value = number
            changeRedSlider()
        case greenCounterTextField:
            greenSlider.value = number
            changeGreenSlider()
        case blueCounterTextField:
            blueSlider.value = number
            changeBlueSlider()
        default:
            break
        }
    }
    
    // MARK: - Setup Formatter
    private func setupFormatter() {
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
    }
    
    // MARK: - Setup
    private func setupUI() {
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
    }
    
    private func setupKeyboardForTextFields() {
        setupKeyboardType(for: redCounterTextField)
        setupKeyboardType(for: greenCounterTextField)
        setupKeyboardType(for: blueCounterTextField)
    }
    
    private func setupKeyboardType(for textField: UITextField) {
        textField.keyboardType = .decimalPad
        
        let keypadToolbar = UIToolbar()
        keypadToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: textField, action: #selector(UITextField.resignFirstResponder))
        ]
        
        keypadToolbar.sizeToFit()
        textField.inputAccessoryView = keypadToolbar
    }
    
    private func setupColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        color?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        fillValue(from: redSlider, for: redCounterLabel, and: redCounterTextField)
        fillValue(from: greenSlider, for: greenCounterLabel, and: greenCounterTextField)
        fillValue(from: blueSlider, for: blueCounterLabel, and: blueCounterTextField)
        
        updateColorView()
    }
    
    private func fillValue(from slider: UISlider, for label: UILabel, and textField: UITextField) {
        let text = formatter.string(from: slider.value as NSNumber)
        label.text = text
        textField.text = text
    }
    
    private func updateColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    // MARK: - Alert
    private func showAlert(title: String?, message: String?, textField: UITextField) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField.becomeFirstResponder()
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
}

