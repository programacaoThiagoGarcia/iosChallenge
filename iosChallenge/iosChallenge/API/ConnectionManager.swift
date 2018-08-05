//
//  ConnectionManager.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

class ConnectionManger {
    func getItem(_ url :String, completion :@escaping(_ result : String?) ->()){
        Connection.connection(url) { (response, fail) in
            if !fail{
                completion(response!)
            }else{
                completion(nil)
            }
        }
    }
}
