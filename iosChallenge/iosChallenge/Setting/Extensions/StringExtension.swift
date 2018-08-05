//
//  StringExtension.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

extension String{
    func prepareURL(_ userId : String)-> String{
        return self.replacingOccurrences(of: "{id}", with: userId)
    }
    
    func toJson() -> [Dictionary<String,Any>]?{
        let data = self.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                
            {
                return jsonArray
                
            } else {
                print("bad json")
                
            }
        } catch let error as NSError {
            print(error)
        }
        return nil
        
    }
}
