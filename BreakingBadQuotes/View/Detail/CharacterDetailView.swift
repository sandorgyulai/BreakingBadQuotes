//
//  CharacterDetailView.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct CharacterDetailView: View {

    @StateObject var list = QuoteList()
    @EnvironmentObject var favorites: Favorites

    let character: Character

    var body: some View {

        ScrollView {
            CharacterDetailHeaderView(character: character)
                .padding(.horizontal)
            if list.quotes.count != 0 {
                HStack {
                    Text("Quotes")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
                ForEach(list.quotes) { quote in
                    QuoteTextView(quoteText: quote.text)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                }
            } else {
                Text("No quotes available for \(character.name).")
                    .caption()
                    .padding()
            }
        }
        .navigationTitle(character.name)
        .toolbar {
            ToolbarItem {
                Button {
                    try? favorites.toggleFavorite(for: character)
                } label: {
                    Image(systemName: favorites.isFavorite(character) ? "star.fill" : "star")
                }
            }
        }
        .onAppear {
            list.getQuotes(for: character)
        }
        
    }

}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: PreviewCharacter.character)
            .environmentObject(Favorites())
    }
}
