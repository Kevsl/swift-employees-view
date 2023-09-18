//
//  UsersListController.swift
//  bestAppPossibleEver
//
//  Created by K on 17/09/2023.
//

import UIKit

class UsersListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var users : [Employee] = []
    let id = "ListCell"
    
    var dict: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func onDictReceived(){
        let results = dict["results"] as? Int ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user =  users[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ListCell{
            cell.setup(user)
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(users[indexPath.row].name?.first ?? "")
    }
    


}
