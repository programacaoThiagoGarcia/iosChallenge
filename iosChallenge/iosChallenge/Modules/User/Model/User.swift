//
//  User.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

struct User: Codable {
    var id      : Int
    var name    : String 
    var userName: String
    var email   : String
    var phone   : String
    
}
struct Users : Codable {
    var users : [User]
}


