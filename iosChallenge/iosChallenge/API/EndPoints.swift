//
//  EndPoints.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

struct NetworkManagerStatus {
    static let enviroment : ConnectionType = .prod
}
enum ConnectionType{
    case prod
    case homolog
}

public enum ItensApi {
    case user
    case albuns(id:Int)
    case photos(id:Int)
    case posts(id:Int)
    case todos(id:Int)
    case comments(id:Int)
}

protocol EndPointType {
    var baseURL            : URL        {get}
    var path               : String     {get}
    var method             : HTTPMethod {get}
}

extension ItensApi: EndPointType {
    var method: HTTPMethod {
        return .get
    }
    
    
    var environmentBaseURL: String {
        switch NetworkManagerStatus.enviroment {
        case .prod    : return "https://jsonplaceholder.typicode.com"
        case .homolog : return ""
        }
    }
    

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .user:
            return "/users"
        case .albuns(let id):
            return "/albums?userId=\(id)"
        case .photos(let id):
            return "/photos?userId=\(id)"
        case .posts(let id):
            return "/posts?userId=\(id)"
        case .todos(let id):
            return "/todos?userId=\(id)"
        case .comments(let id):
            return "/comments?postId=\(id)"
        }
    }
    
}

public enum HTTPMethod : String{
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}




