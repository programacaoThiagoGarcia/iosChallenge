//
//  ConnectionManager.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 20/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

public typealias completionManagerResponse = (_ data : Data?, _ res : URLResponse? ,_ err : Error?) -> ()

protocol NetworkConnectionManager : class {
    associatedtype EndPoint : EndPointType
    func request(_ route : EndPoint, completion:@escaping(completionManagerResponse))
}

class Connection<EndPoint : EndPointType>: NetworkConnectionManager {
    private var task : URLSessionTask?
    func request(_ route: EndPoint, completion: @escaping (completionManagerResponse)) {
        let http = URLSession.shared
        do{
            let request = try self.buildRequest(form: route)
            task = http.dataTask(with: request, completionHandler: { (data, res, err) in
                completion(data, res, err)
            })
        }catch{
            completion(nil,nil,error)
        }
        self.task?.resume()
    }
    
    fileprivate func buildRequest(form route : EndPoint) throws -> URLRequest{
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: 10.0)
        print(request.description)
        
        request.httpMethod = route.method.rawValue
        return request
    }
    
}


