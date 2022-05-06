//
//  ViewController.swift
//  TrafficLight
//
//  Created by trinity on 04.05.2022.
//

import UIKit

enum TrafficLightState {
    case off
    case redLight
    case yellowLight
    case greenLight
}

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Private Properties
    private var trafficLightState = TrafficLightState.off
    
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        changeState(to: .off)
    }
    
    // MARK: - IB Actions
    @IBAction func startButtonPressed() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch trafficLightState {
        case .off:
            changeState(to: .redLight)
        case .redLight:
            changeState(to: .yellowLight)
        case .yellowLight:
            changeState(to: .greenLight)
        case .greenLight:
            changeState(to: .redLight)
        }
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        redLightView.layer.cornerRadius = 60
        yellowLightView.layer.cornerRadius = 60
        greenLightView.layer.cornerRadius = 60
    }
    
    private func changeState(to state: TrafficLightState) {
        trafficLightState = state
        redLightView.alpha = state == .redLight ? 1 : 0.5
        yellowLightView.alpha = state == .yellowLight ? 1 : 0.5
        greenLightView.alpha = state == .greenLight ? 1 : 0.5
    }
    
}

