//
//  Album.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

struct Album: Codable {
    var id     : Int
    var title  : String
    var photos  : [Photo]
}


