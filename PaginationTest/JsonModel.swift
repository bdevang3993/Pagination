//
//  JsonModel.swift
//  PaginationTest
//
//  Created by devang bhavsar on 26/04/24.
//

import Foundation
struct JsonModel : Decodable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}

struct PostIDData : Codable {
    let postId : Int?
    let id : Int?
    let name : String?
    let email : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}
