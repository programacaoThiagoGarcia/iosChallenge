//
//  User.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var connectionManager =  ConnectionManger()
    
    var id      : Int = 0
    var name    : String = ""
    var userName: String = ""
    var email   : String = ""
    var phone   : String = ""
    
    required init?(map: Map) {
        
    }
    
    required init?(){}
    
    func getUsers(_ completion : @escaping([User])->()) {
        connectionManager.getItem(endPointUsers, completion: { (result) in
            if result != nil{
                let json = result?.toJson()
                let users = Mapper<User>().mapArray(JSONArray: json!)
                completion(users)
            }else{
                completion([])
            }
        })
    }
    
    func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["name"]
        userName <- map["username"]
        email    <- map["email"]
        phone    <- map["phone"]
    }
    
    
}


