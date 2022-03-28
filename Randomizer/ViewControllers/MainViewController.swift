//
//  MainViewController.swift
//  Randomizer
//
//  Created by Даниил Смирнов on 28.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber : RandomNumber)
}

class MainViewController: UIViewController {
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var getResultsButton: UIButton!
    
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    override func viewDidLoad() {
        super.viewDidLoad()
        getResultsButton.layer.cornerRadius = 10
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else {return}
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getResultsButtonTapped() {
        resultsLabel.text = String(randomNumber.getRandom)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
    }
    
    
}
