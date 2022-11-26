//
//  CharacterListView.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct CharacterListView: View {

    @StateObject var list = CharacterList()
    @StateObject var favorites = Favorites()

    @State private var favoritesOnly = false
    @State private var searchText = ""

    private var searchResults: [Character] {
        let characters = favoritesOnly ? favoriteList : list.characters
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.contains(searchText) || $0.nickname.contains(searchText) }
        }
    }

    private var favoriteList: [Character] {
        list.characters.filter { favorites.isFavorite($0) }
    }

    var body: some View {

        NavigationStack {
            List(searchResults) { character in
                NavigationLink(value: character) {
                    CharacterCellView(character: character)
                }
            }
            .searchable(text: $searchText, prompt: Text("Name or Nickname..."))
            .navigationDestination(for: Character.self) {
                CharacterDetailView(character: $0)
            }
            .navigationTitle("Characters")
            .toolbar {
                Toggle(isOn: $favoritesOnly) {
                    Text("Favorites only")
                }
            }
        }
        .environmentObject(favorites)
        
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
