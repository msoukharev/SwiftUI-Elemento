//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-22.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /**
    Modal overlaying the applied view
     */
    func modal<Content: View>(active: Binding<Bool>, @ViewBuilder content: @escaping () -> Content ) -> ELMModalView<Self, Content> {
        
        return ELMModalView<Self, Content>(active: active, background: self, overlay: content)
    }
    
    func modal<Content: View>(modal: ELMModalView<Self, Content>) -> ELMModalView<Self, Content> {
        
        return modal
        
    }
    
}

@available(iOS 13.0, *)
public struct ELMModalView<Background: View, Overlay: View>: View {
    
    @Binding private var active: Bool
    private var backgroundView: Background
    private var overlayView: () -> Overlay
    
    init(active: Binding<Bool>, background: Background, @ViewBuilder overlay: @escaping () -> Overlay) {
        
        self._active = active
        self.backgroundView = background
        self.overlayView = overlay
    }
    
    public var body: some View {
        
        ZStack {
            
            if active {
                
                backgroundView.overlay(Color.primary.opacity(0.07))
    
                overlayView().modifier(WindowModifier())
                
            } else {
                
                backgroundView.transition(.opacity).animation(.easeIn(duration: 0.1))
            
            }
            
        }
    }
    
}

@available(iOS 13.0, *)
public extension ELMModalView {
    
    enum OverlayEffect {
        case none, shadow, blur
    }
    
    // TODO: Implement custom background effects
}


fileprivate struct Consumer: View {
    
    @State private var showModel = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(1..<10, id: \.self) { num in
                        Text("Background text \(num)")
                    }
                }.listStyle(InsetListStyle())
                Button("Activate modal", action: {self.showModel.toggle()})
                
            }.modal(active: $showModel) {
                VStack(spacing: 10) {
                    Text("You've activated a modal")
                    Text("Click below to deactivate it")
                    Button("Deactivate modal", action: {self.showModel.toggle()})
                }
            }.animation(.default)
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
