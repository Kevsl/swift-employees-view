import UIKit
import Foundation


class UserViewController: UIViewController {
    
    
    struct User: Codable {
        var id: Int
        var name: String
        var company:Company
    }
    
    struct Company : Codable{
        var name:String
    }
    
    let apiUrl = "https://jsonplaceholder.typicode.com/users"
    
    var usersList:[Employee] = []
    
  
    @IBOutlet weak var mainVIew: EmployeeView!
    
    
    var employeeIndex = 0
    
    
    
    func getUsers() {
        if let url = URL(string: apiUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let usersData = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: usersData)
                        
                        for user in users {
                            self.usersList.append(Employee(name: user.name, company: user.company.name, imageName: "photo\(String(user.id))"))
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        
    }
    
  
    @IBAction func nextEmployee(_ sender: UIButton) {
        if(usersList.count > 0 )
        {
            mainVIew.employee = usersList[employeeIndex]

            if(employeeIndex < usersList.count - 1 )
            {
                employeeIndex += 1
            }else{
                
                employeeIndex = 0
            }
        }

        
        
   }
    
    @IBAction func previousEmployee(_ sender: UIButton) {
        if(usersList.count > 0 )
        {
            if(employeeIndex > 0){
                mainVIew.employee = usersList[employeeIndex]
                employeeIndex -= 1

                
            }else{
                employeeIndex = usersList.count - 1
                mainVIew.employee = usersList[employeeIndex]

            }
            
            
        }
        
        
    }
}

