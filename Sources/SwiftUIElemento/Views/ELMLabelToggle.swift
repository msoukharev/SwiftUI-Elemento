//
//  ELMLabelToggle.swift
//  SwiftUIElemento
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import Foundation
import SwiftUI

@available(iOS 13.0, OSX 10.15, *)
public struct ELMLabelToggle: View {
    
    @Binding var toggle: Bool
    
    var onColor: Color
    
    var offSymbol: String
    
    var onSymbol: String
    
    var label: String?
    
    private var onImage: Image
    private var offImage: Image
    
    public init(onColor: Color, symbol: String, toggle: Binding<Bool>, label: String? = nil) {
        self.init(onColor: onColor, onSymbol: symbol, offSymbol: symbol, toggle: toggle, label: label)
    }
    
    public init(onColor: Color, onSymbol: String, offSymbol: String, toggle: Binding<Bool>, label: String? = nil) {
        self._toggle = toggle
        self.onColor = onColor
        self.onSymbol = onSymbol
        self.offSymbol = offSymbol
        #if os(OSX)
        self.onImage = Image(onSymbol)
        self.offImage = Image(offSymbol)
        #else
        self.onImage = Image(systemName: self.onSymbol)
        self.offImage = Image(systemName: self.offSymbol)
        #endif
        self.label = label
    }
    
    private var image: Image {
        self.toggle ? onImage : offImage
    }
    
    public var body: some View {
        
        HStack {
            
            image.transition(.sideslide(.leading))
            
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

@available(iOS 13.0, OSX 10.15.0, *)
struct ELMLabelToggle_Previews: PreviewProvider {
    
    private struct ConsumerView: View {
        @State private var toggle: Bool = false
        var body: some View {
            VStack {
                ELMLabelToggle(onColor: .orange, onSymbol: "star.fill", offSymbol: "star", toggle: $toggle, label: "Fav")
            }
        }
    }
    
    static var previews: some View {
        ConsumerView()
    }
}


