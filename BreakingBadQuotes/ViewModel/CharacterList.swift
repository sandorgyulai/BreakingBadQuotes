//
//  CharacterList.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import Foundation
import Combine

@MainActor
class CharacterList: ObservableObject {

    @Published var characters: [Character] = []

    private var cancellable: AnyCancellable?

    init() {
        getCharacters()
    }

    func getCharacters() {
        cancellable = API.shared.getData(from: .characters)
            .sink(receiveCompletion: { print("--> Completion: \($0)") },
                  receiveValue: { self.characters = $0 })
    }
}
