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
public struct WindowModifier: ViewModifier {
    
    typealias Paddings = (leading: CGFloat, trailing: CGFloat, top: CGFloat, bottom: CGFloat)
    
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
        
        content.padding(padding).background(Color.tertiaryBackground).clipShape(RoundedRectangle(cornerRadius: 10)).border(Color.clear).shadow(color: Color.secondaryBackground, radius: shadowRadius, x: 0, y: shadowRadius * 0.2)
        
    }
    
}

struct WindowModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("1")
            Text("1")
            Text("1")
            Text("1")
        }.preferredColorScheme(.light).modifier(WindowModifier()).modal(active: false) {
            VStack{
            Text("Some stuff again and again, heh")
            Text("Some stuff again and again, heh")
            Text("Some stuff again and again, heh")
            Text("Some stuff again and again, heh")
            Text("Some stuff again and again, heh")
            }
        }
    }
}
