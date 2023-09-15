//
//  LoginViewController.swift
//  bestAppPossibleEver
//
//  Created by K on 14/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    var name = ""
    var password = ""
    
    @IBOutlet weak var amazingLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(password)
        amazingLabel.text = name
        nameInput.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(hideKeyboard)))

    }
    // action
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func nameEditing(_ sender: UITextField) {
    
        name = nameInput.text ?? ""
        amazingLabel.text = nameInput.text
        
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
}
