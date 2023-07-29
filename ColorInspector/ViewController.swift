//
//  ViewController.swift
//  ColorInspector
//
//  Created by Михаил Ю. Гоженко on 29.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var redSlider: UISlider!
    
    // MARK: - Constans
    let defaultRed: CGFloat = 0.05
    let defaultGreen: CGFloat = 0.27
    let defaultBlue: CGFloat = 0.49
    let minValue: Float = 0
    let maxValue: Float = 1
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBlueSlider()
        setupGreenSlider()
        setupRedSlider()
        
        sliderAction()
        
        colorView.layer.cornerRadius = 16
        colorView.backgroundColor = UIColor(
            red: defaultRed,
            green: defaultGreen,
            blue: defaultBlue,
            alpha: 1
        )
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction() {
        setupLabels()
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    // MARK: - Private Methods
    private func setupLabels() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupRedSlider() {
        redSlider.value = Float(defaultRed)
        redSlider.minimumValue = minValue
        redSlider.maximumValue = maxValue
        redSlider.minimumTrackTintColor = .red
    }
    
    private func setupGreenSlider() {
        greenSlider.value = Float(defaultGreen)
        greenSlider.minimumValue = minValue
        greenSlider.maximumValue = maxValue
        greenSlider.minimumTrackTintColor = .init(
            red: 0.35,
            green: 1,
            blue: 0.55,
            alpha: 1
        )
    }
    
    private func setupBlueSlider() {
        blueSlider.value = Float(defaultBlue)
        blueSlider.minimumValue = minValue
        blueSlider.maximumValue = maxValue
        blueSlider.minimumTrackTintColor = .link
    }
}

