//
//  TextView+CaptionStyle.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import SwiftUI

struct CaptionTextViewStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }

}

extension Text {
    func caption() -> some View {
        self.modifier(CaptionTextViewStyle())
    }
}
