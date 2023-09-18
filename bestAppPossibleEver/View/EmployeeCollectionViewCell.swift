
import UIKit

class EmployeeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var employeeName:UILabel!
    @IBOutlet weak var employeeImage:UIImageView!
    
    var object: Employee!
    
    func setup(_ newObject: Employee){
        object = newObject
        employeeName.text = object.name
        employeeImage.image = object.imageView
        
    }
    
}
