//
//  CategoryModel.swift
//  OuterWear
//
//  Created by NIBMPC04PC03 on 2024-04-07.
//

import Foundation

struct CategoryModel: Identifiable, Decodable {
    var id: String?
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "category"
    }
}


