//
//  Connection.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Connection{
  internal  class func connection(_ url : String, completion: @escaping(String?, _ fail : Bool)->()){
        Alamofire.request(url).responseString { (result) in
//            print(result.result.value)
            if result.response?.statusCode == 200{
                completion(result.result.value!, false)
            }else{
                completion(nil, true)
            }
        }
    }
}


