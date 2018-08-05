//
//  Album.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class Album: Mappable {
    var connectionManager =  ConnectionManger()
    var id     : Int      = 0
    var title  : String   = ""
    var photos  : [Photo]  = []
        
    required init?(map: Map) {}
    required init (){}
    
   func mapping(map: Map) {
        id    <- map["id"]
        title <- map["title"]
        
    }
    
    func getAlbuns(_ id : String, _ completion : @escaping([Album])-> ()){
        connectionManager.getItem(endPointAlbuns.prepareURL(id)) { (result) in
            if result != nil{
                let json = result?.toJson()
                let albuns = Mapper<Album>().mapArray(JSONArray: json!)
                var resultAlbum : [Album] = []
                var cont =  0  {
                    didSet{
                        if cont == albuns.count{
                            completion(resultAlbum)
                        }
                    }
                }
                DispatchQueue.global().async {
                        for a in albuns{
                            let albumId = "\(a.id)"
                            self.getPhotos(albumId, completion: { (result) in
                                a.photos = result
                                resultAlbum.append(a)
                                cont += 1
                            })
                        }
                }
            }else{
                completion([])
            }
        }
    }
    
    private func getPhotos(_ albumId : String, completion : @escaping([Photo])->()){
        let photo = Photo()
        photo.getPhotos(albumId) { (result) in
            completion(result)
        }
      
    }
    
}


