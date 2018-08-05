//
//  Photo.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {
    var connectionManager =  ConnectionManger()
    var title :String  = ""
    var url   :String  = ""
    var thumbnailUrl : String = ""
    
    required init?(map: Map) {
    }
    required init(){}
    
    func mapping(map: Map) {
        title        <- map["title"]
        url          <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
    }
    
    func getPhotos(_ idUser : String, completion:@escaping([Photo])->()){
        connectionManager.getItem(endPointPhotos.prepareURL(idUser)) { (result) in
            if result != nil{
                let json = result?.toJson()
                let photos = Mapper<Photo>().mapArray(JSONArray: json!)
                completion(photos)
            }else{
                completion([])
            }
        }
    }
    
}

