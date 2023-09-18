//
//  LoginViewController.swift
//  bestAppPossibleEver
//
//  Created by K on 14/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    var name = ""
    var password = "usersList"
    let usersListIdentifier = "usersList"

    
    
    @IBOutlet weak var amazingLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(password)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier ==  usersListIdentifier ){
            if let ulController = segue.destination as? UsersListController{
         
                
            }
        }
    }

    
    
    
    // action
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func nameEditing(_ sender: UITextField) {
    
        name = nameInput.text ?? ""
        amazingLabel.text = nameInput.text
        
        
    }
    @IBAction func navigateUsersList(_ sender: UIButton) {
        performSegue(withIdentifier: usersListIdentifier, sender: nil)
        
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
}
