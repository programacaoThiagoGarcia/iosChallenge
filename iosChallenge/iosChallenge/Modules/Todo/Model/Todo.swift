//
//  Todo.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 07/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import ObjectMapper

class Todo: Mappable {
    let connectionManager : ConnectionManger = ConnectionManger()
    var title     : String = ""
    var completed : Bool   = false
    
    required init?(map: Map) {}
    required init(){}
    
     func mapping(map: Map) {
        title     <- map["title"]
        completed <- map["completed"]
    }
   
    func getTodoList(_ userId : String, completion : @escaping([Todo])->()){
        connectionManager.getItem(endPointTodos.prepareURL(userId)) { (result) in
            if result != nil{
                let json = result?.toJson()
                let todo = Mapper<Todo>().mapArray(JSONArray: json!)
                completion(todo)
            }else{
                completion([])
            }
        }
    }
}
