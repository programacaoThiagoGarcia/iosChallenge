//
//  PostViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 06/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    var posts  : [Post] = []
    var userId : String?
    
    var mainView : PostView{
        get{
            return self.view as! PostView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareDataSource()
        self.mainView.tableView.delegate   = self
        self.mainView.tableView.dataSource = self

    }
    
    func prepareDataSource(){
        self.mainView.indicator.startAnimating()
        let post = Post()
        post.getPost(userId!) { (result) in
            if result.count == 0{
                let alert = UIAlertController(title: "Ops", message: "Empty users found!!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            self.posts.append(contentsOf: result)
            self.mainView.tableView.reloadData()
            self.mainView.indicator.stopAnimating()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToComments"{
            let vc = segue.destination as! CommentViewController
            let row = sender as! Int
            vc.body      = posts[row].body
            vc.postId    = "\(posts[row].id)"
            vc.titlePost = "\(posts[row].title)"
        }
    }

}

extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToComments", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        cell.lblTitle.text = posts[indexPath.row].title as! String
        cell.lblBody.text  = posts[indexPath.row].body as! String
        return cell
    }
    
    
    
}
