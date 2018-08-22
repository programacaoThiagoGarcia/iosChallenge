//
//  Service.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 22/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

class Service {
    class func readJsonLocal(_ data : Data) -> String{
        var dataString: String = ""
        do {
            dataString = try String(data: data, encoding: String.Encoding.utf8)!
            
            return "{\"result\":\(dataString)}"
            
        } catch {
            
            return dataString
        }

    }
    
}
