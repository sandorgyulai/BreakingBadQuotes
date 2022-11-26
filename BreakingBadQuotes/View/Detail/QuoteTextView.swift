//
//  QuoteTextView.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct QuoteTextView: View {

    let quoteText: String

    var body: some View {

        HStack {
            VStack {
                Image(systemName: "quote.opening")
                Spacer()
            }
            Text(quoteText)
                .font(.headline)
            VStack {
                Spacer()
                Image(systemName: "quote.closing")
            }
            Spacer()
        }
        
    }
}

struct QuoteTextView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteTextView(quoteText: PreviewQuote.quote.text)
    }
}
