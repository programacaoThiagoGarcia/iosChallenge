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
