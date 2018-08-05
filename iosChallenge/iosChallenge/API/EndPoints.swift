//
//  EndPoints.swift
//  iosChallenge
//
//  Created by Thiago Gomes on 05/08/18.
//  Copyright © 2018 programacaoThiagoGarcia. All rights reserved.
//

import Foundation

private let BASEURL = "https://jsonplaceholder.typicode.com"

let endPointUsers = "\(BASEURL)/users"

let endPointAlbuns = "\(BASEURL)/albums?userId={id}"

let endPointPhotos = "\(BASEURL)/photos?userId={id}"

let endPointPosts  = "\(BASEURL)/posts?userId={id}"

let endPointTodos  = "\(BASEURL)/todos?userId={id}"


