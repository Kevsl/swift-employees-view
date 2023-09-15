import Foundation
import UIKit

class Employee{
    var name:String?
    var company:String?
    var imageName:String?
    var imageView:UIImage?{
        return UIImage(named: imageName!)
    }
    
    init(name: String? , company: String?, imageName: String?) {
        self.name = name
        self.company = company
        self.imageName = imageName
    }
}

