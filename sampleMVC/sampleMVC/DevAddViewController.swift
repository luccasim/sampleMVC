//
//  AddViewController.swift
//  sampleMVC
//
//  Created by Luc Casimir on 26/06/2017.
//  Copyright © 2017 Luc Casimir. All rights reserved.
//

import UIKit

class DevAddViewController: UIViewController {

//MARK: Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

//MARK: VC lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        nameTextField.delegate = self
        nameTextField.placeholder = "name"
    }
    
//MARK: Actions
    
    /// Save Button
    
    @IBAction func saveData(_ sender: Any) {
         performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    fileprivate func activeSaveButton(){
        guard let name = nameTextField.text else {
            return ;
        }
        saveButton.isEnabled = (name.isEmpty) ? false : true
    }

//MARK: Navigation
    
    /// Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return ;
        }
        switch identifier {
        case "unwindSegue":
            if let dvc = segue.destination as? DevListViewController,
                let name = nameTextField.text {
                dvc.devDataManager.add(Name: name)
            }
        default:
            break
        }
    }
}

//MARK: TextField

extension DevAddViewController : UITextFieldDelegate {
    
    /// Returns Pressed
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let _ = textField.text {
            activeSaveButton()
        }
        return textField.resignFirstResponder()
    }
}
