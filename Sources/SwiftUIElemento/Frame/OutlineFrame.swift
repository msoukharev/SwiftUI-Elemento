//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-06.
//

import SwiftUI


@available(iOS 13.0, *)
@frozen public struct OutlineFrame<ClipShape: Shape, StrokeStyle: ShapeStyle>: FrameStyle {
    
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
        return content.frameStyle(FrameModifier(padding: padding, background: Color.clear, clipShape: clipShape)).overlay(clipShape.stroke(strokeStyle, lineWidth: strokeWidth))
    }
}


public extension OutlineFrame {
    
    init(padding: CGFloat = 15, clipShape: ClipShape, strokeStyle: StrokeStyle, strokeWidth: CGFloat = 1.0) {
        self.init(padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding), clipShape: clipShape, strokeStyle: strokeStyle, strokeWidth: strokeWidth)
    }
}


fileprivate struct Consumer: View {
    @State private var flag: Bool = false
    var body: some View {
        VStack {
            Button("Toggle") {
                self.flag.toggle()
            }
            Text("Hello world").frameStyle(OutlineFrame(padding: 120,clipShape: RoundedRectangle(cornerRadius: flag ? 10 : 15), strokeStyle: flag ? Color.accentColor : Color.primary)).animation(.default)
        }
    }
}


struct OutlineFrame_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
