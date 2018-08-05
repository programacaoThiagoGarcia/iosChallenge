//
//  PhotosViewController.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import UIKit
import SDWebImage

class PhotosViewController: UIViewController {
    var photos : [Photo]?
    var album  : String?
    var mainView : PhotosView{
        get{
            return self.view as! PhotosView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.collection.delegate = self
        self.mainView.collection.dataSource = self
        self.navigationItem.title = album!

    }


}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        let url = URL(string: photos![indexPath.row].url)
        cell.imgPhoto.sd_setImage(with: url!, completed: nil)
        return cell
    }
    
    
}
