//
//  AlbumViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumViewController: UIViewController {
    var albuns : [Album] = []
    var idUser : String?
    var mainView : AlbumView {
        get {
            return self.view as! AlbumView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.indicator.startAnimating()
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.prepareDataSource()

    }
    
    func prepareDataSource() {
        let album : Album = Album()
        album.getAlbuns(self.idUser!) { (result) in
            if result.count == 0{
                let alert = UIAlertController(title: "Ops", message: "Empty users found!!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
                self.albuns.append(contentsOf: result)
                self.mainView.tableView.reloadData()
                self.mainView.indicator.stopAnimating()
            
        }
        
    }


  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPhoto"{
            let row = sender as! Int
            let vc = segue.destination as! PhotosViewController
            vc.photos = albuns[row].photos as! [Photo]
            vc.album  = albuns[row].title as! String
        }
    }
 

}

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albuns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlbumTableViewCell
        cell.lblAlbumTitle.text = albuns[indexPath.row].title
        
        let url = URL(string: albuns[indexPath.row].photos[0].thumbnailUrl)
        cell.imgAlbumImage.sd_setImage(with: url!,
                                       placeholderImage: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToPhoto", sender: indexPath.row)
    }
    
    

    
}
