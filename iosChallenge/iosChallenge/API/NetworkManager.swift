//
//  NetworkManager.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 20/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation


protocol NetworkManagerProtocol {
    
    
}

struct NetworkManager<T : Decodable> {
    let router = Connection<ItensApi>()
    
    func getItens(_ endPoint : ItensApi, _ completion:@escaping(T?)-> ()){
        router.request(endPoint) { (data, res, err) in
            if err != nil{
            }
            guard let resData = data else{
                completion(nil)
                return
            }
            do{
                let type : T.Type = T.self
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
                let jsonString = Service.readJsonLocal(data!)
                print(jsonString)
                let apiResponse = try JSONDecoder().decode(type, from: jsonString.data(using: .utf8)!)
                print(apiResponse)
                completion(apiResponse)
            }catch{
                print("Bad Json")
                
            }
        }
    }
  
}
