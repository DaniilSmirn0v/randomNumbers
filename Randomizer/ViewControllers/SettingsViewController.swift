//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Даниил Смирнов on 28.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var minimumValueTF: UITextField!
    @IBOutlet weak var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
    }
    
    @IBAction func cancelButtonTapped(){
        dismiss(animated: true)
    }
    @IBAction func saveButtonTapped(){
        view.endEditing(true )
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
