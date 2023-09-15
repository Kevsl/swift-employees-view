//
//  ViewController.swift
//  bestAppPossibleEver
//
//  Created by K on 14/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    let navigateToLoginIdentifier = "navigateToLogin"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier ==  navigateToLoginIdentifier ){
            if let nextController = segue.destination as? LoginViewController{
                nextController.name = "un autre label est possible"
                
                nextController.password = "Azert123!"
            }
        }
    }

    @IBAction func navigateToLoginAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: navigateToLoginIdentifier, sender: nil)
        
        
    }
}

