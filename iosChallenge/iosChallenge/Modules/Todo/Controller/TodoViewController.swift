//
//  TodoViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 07/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    var mainView: TodoView{
        get{
            return self.view as! TodoView
        }
    }
    var userId : String?
    var todos : [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.tableview.delegate   = self
        self.mainView.tableview.dataSource = self
        self.prepareDataSource()
        
    }
    func prepareDataSource(){
        self.mainView.indicator.startAnimating()
        Todo().getTodoList(userId!) { (result) in
            if result.count == 0{
                let alert = UIAlertController(title: "Ops", message: "Empty users found!!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.todos.append(contentsOf: result)
            self.mainView.tableview.reloadData()
            self.mainView.indicator.stopAnimating()
        }
    }
}

extension TodoViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TodoTableViewCell
        cell.lblTitle.text = todos[indexPath.row].title
        cell.imgComplet.image = todos[indexPath.row].completed ? UIImage(named: "like"):UIImage(named: "dislike")
        return cell
    }
    
    
}
