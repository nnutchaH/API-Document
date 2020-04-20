//
//  ModelPage.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation

struct Detail: Codable {
    let data: DataClass
    let status: Int
}

// MARK: - DataClass
struct DataClass: Codable {
    let customerGrade, id: String
    let isCustomerPremium: Bool
    let name, sex: String
}
