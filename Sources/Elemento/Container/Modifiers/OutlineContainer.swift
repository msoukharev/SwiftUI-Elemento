//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-06.
//

import SwiftUI


@available(iOS 13.0, *)
public struct OutlineContainer<ClipShape: Shape, StrokeStyle: ShapeStyle>: ContainerStyle {
    
    private var padding: EdgeInsets
    private var clipShape: ClipShape
    
    private var strokeStyle: StrokeStyle
    private var strokeWidth: CGFloat
    
    public init(padding: EdgeInsets, clipShape: ClipShape, strokeStyle: StrokeStyle, strokeWidth: CGFloat = 1.0) {
        self.padding = padding
        self.clipShape = clipShape
        self.strokeStyle = strokeStyle
        self.strokeWidth = strokeWidth
    }
    
    public func body(content: Content) -> some View {
        content.container(ContainerModifier(padding: padding, background: Color.clear, clipShape: clipShape))
    }
}


@available(iOS 13.0, *)
public extension OutlineContainer {
    
    init(padding: CGFloat = 15, clipShape: ClipShape, strokeStyle: StrokeStyle, strokeWidth: CGFloat = 1.0) {
        self.init(padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding), clipShape: clipShape, strokeStyle: strokeStyle, strokeWidth: strokeWidth)
    }
}
