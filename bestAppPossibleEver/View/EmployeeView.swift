//
//  EmployeeView.swift
//  bestAppPossibleEver
//
//  Created by K on 15/09/2023.
//

import UIKit

class EmployeeView: UIView {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var companyLabel : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    
    var employee : Employee!{
        didSet{
            nameLabel.text = employee.name
            imageView.image = employee.imageView
            companyLabel.text = employee.company
            
        }
    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
           self.backgroundColor = .clear
        }
    
    
    
    
    
    
    

}
