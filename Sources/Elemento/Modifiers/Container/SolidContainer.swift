//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-06.
//

import SwiftUI


@available(iOS 13.0, *)
public struct SolidContainer<ClipShape: Shape>: ContainerStyle {
    
    private var padding: EdgeInsets
    private var clipShape: ClipShape
    private var color: Color = Color.secondaryBackground
    
    public init(padding: EdgeInsets, color: Color, clipShape: ClipShape) {
        self.padding = padding
        self.clipShape = clipShape
    }
    
    public func body(content: Content) -> some View {
        return content.container(SolidContainer(padding: padding, color: color, clipShape: clipShape))
    }
}


@available(iOS 13.0, *)
public extension SolidContainer {
    
    init(clipShape: ClipShape) {
        self.init(padding: 15, color: Color.secondaryBackground, clipShape: clipShape)
    }
    
    init(padding: CGFloat = 15, color: Color, clipShape: ClipShape) {
        self.init(padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding), color: color, clipShape: clipShape)
    }
}



