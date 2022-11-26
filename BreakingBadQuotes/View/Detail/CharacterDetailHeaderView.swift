//
//  CharacterDetailHeaderView.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct CharacterDetailHeaderView: View {

    let character: Character

    var body: some View {

        HStack {

            AsyncImage(url: character.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "hourglass.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 200)
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {

                Text("Nickname:")
                    .caption()
                Text(character.nickname)

                Text("Birthday:")
                    .caption()
                Text(character.birthday)

                Text("Status:")
                    .caption()
                Text(character.status)

                Text("Portrayed by:")
                    .caption()
                Text(character.portrayed)

                Spacer()
            }

            Spacer()
        }
        
    }
}

struct CharacterDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailHeaderView(character: PreviewCharacter.character)
            .frame(height: 200)
    }
}
