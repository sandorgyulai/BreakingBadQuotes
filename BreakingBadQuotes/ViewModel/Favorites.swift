//
//  Favorites.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

@MainActor
class Favorites: ObservableObject {

    private static let key = "favorites"

    @Published var favorites: Set<Int> = []

    init() {
        loadFavorites()
    }

    func toggleFavorite(for character: Character) throws {
        if favorites.contains(character.id) {
            favorites.remove(character.id)
        } else {
            favorites.insert(character.id)
        }
        try saveFavorites()
    }

    func isFavorite(_ character: Character) -> Bool {
        favorites.contains(character.id)
    }

    private func loadFavorites() {
        guard let file = try? FileHandle(forReadingFrom: try fileURL()),
              let dictionary = try? JSONSerialization.jsonObject(with: file.availableData) as? [String: [Int]],
              let favoritesArray = dictionary[Favorites.key] else {
            return
        }
        favorites = Set(favoritesArray)
    }

    private func saveFavorites() throws {
        let dict = [Favorites.key: Array(favorites)]
        let data = try JSONSerialization.data(withJSONObject: dict)
        try data.write(to: try fileURL())
    }

    private func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("\(Favorites.key).json")
    }

}
