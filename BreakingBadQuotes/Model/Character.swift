//
//  Character.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import Foundation

struct Character: Codable, Identifiable, Hashable {

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case nickname
        case birthday
        case status
        case portrayed
        case imageURL = "img"
    }

    var id: Int
    var name: String
    var nickname: String
    var birthday: String
    var status: String
    var portrayed: String
    var imageURL: URL

}
