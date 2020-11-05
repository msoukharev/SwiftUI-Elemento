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
public struct EMSwitch: View {
    
    @Binding private var toggle: Bool
    private var symbol: String
    private var label: String?
    private var mode: Self.Mode
    
    public init(symbol: String, toggle: Binding<Bool>, label: String? = nil, mode: EMSwitch.Mode) {
        self._toggle = toggle
        self.symbol = symbol
        self.label = label
        self.mode = mode
    }
    
    public var body: some View {
        
        HStack {
            
            Image(systemName: symbol, fill: toggle).imageScale(.medium).padding(2)
            
            if let label = label, mode.expanded(toggle: toggle) {
                Text(label).transition(.sideslide(.trailing)).padding(0)
            }
            
        }
        .onTapGesture {
            self.toggle.toggle()
        }
        .padding(12).background(toggle ? Color.accentColor : Color.secondaryBackground).clipShape(Capsule())
        // Makes it look more dynamic.
        .animation(.easeIn(duration: (self.mode == Mode.static) ? 0.15 : 0.2))
        
    }
    
    
    public struct Mode: Equatable {
        
        private var expandSelected: Bool
        private var expandContracted: Bool
        
        private init(expandSelected: Bool, expandContracted: Bool) {
            self.expandSelected = expandSelected
            self.expandContracted = expandContracted
        }
        
        public static let `static` = Mode(expandSelected: true, expandContracted: true)
        public static let contract = Mode(expandSelected: false, expandContracted: true)
        public static let expand = Mode(expandSelected: true, expandContracted: false)
        
        func expanded(toggle: Bool) -> Bool {
            toggle ? expandSelected : expandContracted
        }
        
    }
    
    
}


@available(iOS 13.0, *)
struct EMSwitch_Previews: PreviewProvider {
    
    private struct ConsumerView: View {
        @State private var toggle: Bool = false
        @State private var toggle1: Bool = true
        @State private var toggle2: Bool = true
        var body: some View {
            VStack {
                VStack {
                    Text("How would you describe your trip?")
                }.modifier(FrameModifier()).padding()
                HStack {
                    EMSwitch(symbol: "star", toggle: $toggle, label: "Important", mode: .contract).accentColor(.orange)
                    
                    EMSwitch(symbol: "person", toggle: $toggle1, label: "Social", mode: .expand).accentColor(.purple)
                    
                    EMSwitch(symbol: "person", toggle: $toggle2, label: "Social", mode: .static).accentColor(.green)
                }
            }
        }
    }
    
    static var previews: some View {
        ConsumerView()
            .preferredColorScheme(.light)
    }
}


