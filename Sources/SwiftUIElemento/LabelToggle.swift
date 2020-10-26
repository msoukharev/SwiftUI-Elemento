//
//  ELMLabelToggle.swift
//  SwiftUIElemento
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import Foundation
import SwiftUI

// TODO: Customizable expand/contract behavior
/**
 Creates a togglable label with a symbol and optional text. The text is shown when the label is loggled off and disappears when the label is toggled on.
 */
@available(iOS 13.0, *)
public struct ELMLabelToggle: View {
    
    @Binding var toggle: Bool
    
    var onColor: Color
    
    var symbol: String
    
    var label: String?
    
    public init(onColor: Color, symbol: String, toggle: Binding<Bool>, label: String? = nil) {
        self._toggle = toggle
        self.onColor = onColor
        self.symbol = symbol
        self.label = label
    }
    
    public var body: some View {
        
        HStack {
            
            FillableSymbol(symbol, filled: toggle)
            
            // Text label if any
            if let label = label, toggle {
                Text(label).transition(.sideslide(.trailing))
            }
            
        }
        .onTapGesture {
            self.toggle.toggle()
        }
        .padding(12).background(toggle ? onColor : Color.secondary.opacity(0.30)).clipShape(Capsule())
        .animation(.easeIn(duration: 0.2))
        
    }
    
}

@available(iOS 13.0, *)
struct ELMLabelToggle_Previews: PreviewProvider {
    
    private struct ConsumerView: View {
        @State private var toggle: Bool = false
        var body: some View {
            VStack {
                ELMLabelToggle(onColor: .red, symbol: "star", toggle: $toggle, label: "Important")
            }
        }
    }
    
    static var previews: some View {
        ConsumerView()
    }
}


