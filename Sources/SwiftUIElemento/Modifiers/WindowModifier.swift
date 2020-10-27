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
    
    private var borderRadius: CGFloat
    private var shadowRadius: CGFloat
    private var padding: CGFloat
    
    public init(borderRadius: CGFloat = 15, shadowRadius: CGFloat = 10, padding: CGFloat = 15) {
        self.borderRadius = borderRadius
        self.shadowRadius = shadowRadius
        self.padding = padding
    }
    
    
    public func body(content: Content) -> some View {
        
        content.padding(padding).background(Color(UIColor.systemBackground)).clipShape(RoundedRectangle(cornerRadius: 10)).border(Color.clear).shadow(color: Color.primary.opacity(0.2), radius: shadowRadius, x: 0, y: shadowRadius * 0.2)
        
    }
    
}
