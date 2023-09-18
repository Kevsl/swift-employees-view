//
//  ListCell.swift
//  bestAppPossibleEver
//
//  Created by K on 17/09/2023.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var iv:UIImageView!
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var cellTitle:UILabel!
    
    var user: Employee!
    
    func setup(_ newUser:Employee){
        user = newUser
        self.iv.image = UIImage(named:user.imageName ?? "")
        self.nameLbl.text = user.name
    }
    

}
