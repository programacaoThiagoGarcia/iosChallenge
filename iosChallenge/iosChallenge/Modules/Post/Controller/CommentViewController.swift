//
//  CommentViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 06/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    var comments : [Comment] = []
    var mainView : CommentView {
        get{
            return self.view as! CommentView
        }
    }
    var body       : String?
    var postId     : String?
    var titlePost  : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.prepareDataSource()
        self.navigationItem.title = titlePost!

    }
    
    func prepareDataSource(){
        self.mainView.indicator.startAnimating()
        Comment().getCommentes(postId!) { (result) in
            self.comments.append(contentsOf: result)
            self.mainView.tableView.reloadData()
            self.mainView.indicator.stopAnimating()
        }
    
    }


}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! CommentsHeaderTableView
        header.lblBody.text = body!
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0 
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        cell.lblName.text = "Name: \(self.comments[indexPath.row].name)"  
        cell.lblBody.text = self.comments[indexPath.row].body
        return cell
    }
    
    
}
