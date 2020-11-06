//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-26.
//

import SwiftUI


public protocol FrameStyle: ViewModifier {}

/**
 Adds a border and a shadow around it to the modified view
 */
@available(iOS 13.0, *)
@frozen public struct FrameModifier<Background: View, ClipShape: Shape>: FrameStyle {
    
    private var padding: EdgeInsets
    private var background: Background
    private var clipShape: ClipShape
    
    init(padding: EdgeInsets, background: Background, clipShape: ClipShape) {
        self.padding = padding
        self.background = background
        self.clipShape = clipShape
    }
    
    public func body(content: Content) -> some View {
        
        content.padding(padding).background(background).clipShape(clipShape)
        
    }
    
}


@available(iOS 13.0, *)
public extension FrameModifier {
    
    init(padding: CGFloat = 15, background: Background, clipShape: ClipShape) {
        self.init(padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding), background: background, clipShape: clipShape)
    }
    
}


struct FrameModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
        }.preferredColorScheme(.light).modifier(FrameModifier(padding: 25, background: LinearGradient(gradient: Gradient.init(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom), clipShape: RoundedRectangle(cornerRadius: 10))).preferredColorScheme(.dark)
        VStack {
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
            Text("_______________________")
        }.preferredColorScheme(.light).modifier(FrameModifier(padding: 25, background: LinearGradient(gradient: Gradient.init(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom), clipShape: RoundedRectangle(cornerRadius: 10))).preferredColorScheme(.dark)
    }
}
