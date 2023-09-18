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
    
    let usersCollectionSegue = "usersListCollection"
    
  
    @IBOutlet weak var mainVIew: EmployeeView!
    
    
    var employeeIndex = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier ==  usersCollectionSegue ){
            if let nextController = segue.destination as? EmployeesCollectionViewController{
                nextController.users = usersList
                
            }
        }
    }
    
    func getUsers() {
        if let url = URL(string: apiUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let usersData = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: usersData)
                        
                        for user in users {
                            self.usersList.append(Employee(name: user.name, company: user.company.name, imageName: "photo\(String(user.id))"))
                            }
                        DispatchQueue.main.async{
                            self.updateEmployeeView()
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func updateEmployeeView(){
        if(usersList.count > 0 ){
            mainVIew.employee = usersList[employeeIndex]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        
    }
    
  
    @IBAction func nextEmployee(_ sender: UIButton) {
        if(usersList.count > 0 )
        {
            updateEmployeeView()

            if(employeeIndex < usersList.count - 1 )
            {
                employeeIndex += 1
            }else{
                
                employeeIndex = 0
            }
        }

        
        
   }
    
    @IBAction func usersCollectionAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: usersCollectionSegue, sender: nil)
    }
    
    @IBAction func previousEmployee(_ sender: UIButton) {
        if(usersList.count > 0 )
        {
            if(employeeIndex > 0){
                updateEmployeeView()

                employeeIndex -= 1

                
            }else{
                employeeIndex = usersList.count - 1
                updateEmployeeView()

            }
            
            
        }
        
        
    }
}

