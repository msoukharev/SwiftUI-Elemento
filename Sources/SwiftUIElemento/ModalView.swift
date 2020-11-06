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
     Modal overlaying the applied view.
     
     ISSUE: the current implementation defaults the animation of the underlying view for the sake of defaulting the animation of the modal view.
     */
    func modal<Content: View>(active: Bool, @ViewBuilder content: @escaping () -> Content ) -> ELMModalView<Self, Content> {
        
        return ELMModalView<Self, Content>(active: active, background: self, overlay: content)
    }
    
}

@available(iOS 13.0, *)
public struct ELMModalView<Background: View, Overlay: View>: View {
    
    private var active: Bool
    private var backgroundView: Background
    private var overlayView: () -> Overlay
    
    init(active: Bool, background: Background, @ViewBuilder overlay: @escaping () -> Overlay) {
        
        self.active = active
        self.backgroundView = background
        self.overlayView = overlay
        
    }
    
    public var body: some View {
        
        ZStack {
                
            backgroundView.overlay(active ? Color.primary.opacity(0.07) : Color.clear)

            if active {
                overlayView()
            }
            
        }.animation(.default)
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
    @State private var numbers = Array(1..<10)
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(numbers, id: \.self) { num in
                        Text("Background text \(num)")
                    }.onDelete(perform: { indexSet in
                        numbers.remove(atOffsets: indexSet)
                    })
                }.listStyle(InsetListStyle())
                
                Button("Activate modal", action: {self.showModel.toggle()})
                Button("Add", action: {numbers.append((numbers.last ?? 0) + 1)})
                
            }.modal(active: showModel) {
                
                VStack(spacing: 10) {
                    Text("You've activated a modal")
                    Text("Click below to deactivate it")
                    Button("Deactivate modal", action: {self.showModel.toggle()})
                }
                
            }
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
