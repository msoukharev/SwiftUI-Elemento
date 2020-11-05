//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-26.
//

import SwiftUI

/**
 Adds a border and a shadow around it to the modified view
 */
@available(iOS 13.0, *)
public struct FrameModifier: ViewModifier {
    
    private var borderRadius: CGFloat
    private var shadowRadius: CGFloat
    private var padding: EdgeInsets
    
    public init(borderRadius: CGFloat = 15, shadowRadius: CGFloat = 10, padding: CGFloat = 15) {
        self.init(borderRadius: borderRadius, shadowRadius: shadowRadius, padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
    }
    
    public init(borderRadius: CGFloat = 15, shadowRadius: CGFloat = 10, padding: EdgeInsets) {
        self.borderRadius = borderRadius
        self.shadowRadius = shadowRadius
        self.padding = padding
    }
    
    
    public func body(content: Content) -> some View {
        
        content.padding(padding).background(Color.secondaryBackground).clipShape(RoundedRectangle(cornerRadius: 10)).border(Color.clear)//.shadow(color: Color.black.opacity(0.1), radius: shadowRadius, x: 0, y: shadowRadius * 0.2)
        
    }
    
}

struct WindowModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
        }.preferredColorScheme(.light).modifier(FrameModifier()).preferredColorScheme(.dark)
        VStack {
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
        }.preferredColorScheme(.light).modifier(FrameModifier()).preferredColorScheme(.light)
    }
}
