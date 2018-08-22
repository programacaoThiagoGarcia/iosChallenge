//
//  UsersTableViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users : [User] = []
    static let enviroment : ConnectionType = .prod

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        let networkManager = NetworkManager<Result<User>>()
        
        networkManager.getItens(.user) { (res) in
            self.users = (res?.result)!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        cell.lblName.text     = users[indexPath.row].name
        cell.lblEmail.text    = users[indexPath.row].email
        cell.lblUserName.text = users[indexPath.row].userName
        cell.lblPhone.text    = users[indexPath.row].phone
        return cell
    }
  
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userToTabBar", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userToTabBar"{
            if let tabbarController = segue.destination as? UITabBarController{
                let user = tabbarController.viewControllers![0] as! AlbumViewController
                let row = sender as! Int
                user.idUser = "\(users[row].id)"
                
                let post = tabbarController.viewControllers![1] as! PostViewController
                post.userId = "\(users[row].id)"
                
                let todo = tabbarController.viewControllers![2] as! TodoViewController
                todo.userId = "\(users[row].id)"
                
            }
        }
    
    }
  

}


