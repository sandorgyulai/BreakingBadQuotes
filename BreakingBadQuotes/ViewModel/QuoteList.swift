//
//  QuoteList.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI
import Combine

@MainActor
class QuoteList: ObservableObject {

    @Published var quotes: [Quote] = []

    private var cancellable: AnyCancellable?

    func getQuotes(for character: Character) {

        let parameters = ["author": character.name]

        cancellable = API.shared.getData(from: .quote, with: parameters)
            .sink(receiveCompletion: { print("--> Completion: \($0)") },
                  receiveValue: { self.quotes = $0 })
    }

}
