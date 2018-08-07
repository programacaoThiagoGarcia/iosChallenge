//
//  Post.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 06/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    
    var connectionManager =  ConnectionManger()
    var id    : Int = 0
    var title : String = ""
    var body  : String = ""
    
    required init?(map: Map) {}
    required init(){}
    
     func mapping(map: Map) {
        id    <- map["id"]
        title <- map["title"]
        body  <- map["body"]
    }
    
    
    func getPost(_ userId : String, completion : @escaping([Post])->()){
        connectionManager.getItem(endPointPosts.prepareURL(userId)) { (result) in
            if result != nil{
                let json = result?.toJson()
                let post = Mapper<Post>().mapArray(JSONArray: json!)
                completion(post)
            }else{
                completion([])
            }
        }
    }
   
}

