//
//  Quote.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import Foundation

struct Quote: Codable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case text = "quote"
        case author
    }

    var id: Int
    var text: String
    var author: String

}
