//
//  CharacterCellView.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct CharacterCellView: View {

    @EnvironmentObject private var favorites: Favorites

    let character: Character

    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .bold()
                Text(character.nickname)
                    .caption()
            }
            Spacer()
            Button {
                withAnimation {
                    try? favorites.toggleFavorite(for: character)
                }
            } label: {
                Image(systemName: favorites.isFavorite(character) ? "star.fill" : "star")
            }
            .foregroundColor(.accentColor)
            .font(.system(size: 24))
            .buttonStyle(.plain)
        }
        .padding(.vertical, 4)

    }

}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(character: PreviewCharacter.character)
            .padding()
            .environmentObject(Favorites())
    }
}
