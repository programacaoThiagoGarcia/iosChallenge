//
//  Comment.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 06/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class Comment: Mappable {
    var connectionManager : ConnectionManger = ConnectionManger()
    var name : String = ""
    var body : String = ""
    
    required init?(map: Map) {}
    required init(){}
    
    func getCommentes(_ postId : String, _ completion : @escaping([Comment])-> ()){
        connectionManager.getItem(endPointComments.prepareURL(postId)) { (result) in
            if result != nil{
                let json = result?.toJson()
                let comment = Mapper<Comment>().mapArray(JSONArray: json!)
                completion(comment)
            }else{
                completion([])
            }
        }
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        body <- map["body"]
    }
    
    
}
