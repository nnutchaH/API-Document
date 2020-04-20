//
//  LoginPage.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation

struct Login: Codable {
    let customers: [Customer]
    let status: Int
    let token: String
}

struct Customer: Codable{
    let id: String
    let name: String
}

struct loginRequest: Codable {
    let username: String
    let password: String
}
