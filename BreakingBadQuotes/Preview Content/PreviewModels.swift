//
//  PreviewModels.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import Foundation

struct PreviewCharacter {

    static let character = Character(id: 1,
                                    name: "Walter White",
                                    nickname: "Heisenberg",
                                    birthday: "09-07-1958",
                                    status: "Presumed dead",
                                    portrayed: "Bryan Cranston",
                                    imageURL: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!)

}

struct PreviewQuote {

    static let quote = Quote(id: 1,
                             text: "I am not in danger, Skyler. I am the danger!",
                             author: "Walter White")

}
