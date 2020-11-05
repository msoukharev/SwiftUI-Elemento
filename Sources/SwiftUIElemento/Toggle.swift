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
public struct ELMToggle: View {
    
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
            
            Image(systemName: symbol, fill: toggle).imageScale(.medium).padding(2)
            
            // Text label if any
            if let label = label, toggle {
                Text(label).transition(.sideslide(.trailing)).padding(0)
            }
            
        }
        .onTapGesture {
            self.toggle.toggle()
        }
        .padding(12).background(toggle ? onColor : Color.secondaryBackground).clipShape(Capsule())
        .animation(.easeIn(duration: 0.2))
        
    }
    
}

@available(iOS 13.0, *)
struct ELMToggle_Previews: PreviewProvider {
    
    private struct ConsumerView: View {
        @State private var toggle: Bool = false
        @State private var toggle1: Bool = true
        var body: some View {
            VStack {
                VStack {
                    Text("How would you describe your trip?")
                }.modifier(FrameModifier()).padding()
                HStack {
                ELMToggle(onColor: .orange, symbol: "star", toggle: $toggle, label: "Important")
                    
                    ELMToggle(onColor: .purple, symbol: "person", toggle: $toggle1, label: "Social")
                }
            }
        }
    }
    
    static var previews: some View {
        ConsumerView()
            .preferredColorScheme(.dark)
    }
}


