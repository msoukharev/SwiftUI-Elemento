//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-22.
//

import SwiftUI

public extension View {
    
    /**
    Modal overlaying the applied view
     */
    
    // TODO: Add animation
    func modal<Content: View>(active: Bool, @ViewBuilder content: @escaping () -> Content ) -> some View {
        
        return ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                
            self
            
            
            active ? content() : nil
                
        }
    }
}

fileprivate struct Consumer: View {
    
    @State private var showModel = false
    
    var body: some View {
        VStack {
            Button("Activate modal", action: {self.showModel.toggle()})
        }.modal(active: showModel) {
            Button("Deactivate modal", action: {self.showModel.toggle()}).padding().background(Color.black).animation(.easeIn, value: showModel)
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
