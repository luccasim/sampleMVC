//
//  EditViewController.swift
//  sampleMVC
//
//  Created by Luc Casimir on 26/06/2017.
//  Copyright © 2017 Luc Casimir. All rights reserved.
//

import UIKit

class DevEditViewController: UIViewController {
    
//MARK: Outlets

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var editButton: UIBarButtonItem!

//MARK: Properties
    
    var data : Dev?
    
//MARK: VC Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        nameTextField.text = data?.name
    }

//MARK: Actions
    
    /// Edit Button
    
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        data?.name = nameTextField.text
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
}

//MARK: TextField

extension DevEditViewController : UITextFieldDelegate {

    /// Returns pressed
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let str = textField.text {
            data?.name = str
        }
        return textField.resignFirstResponder()
    }
}
