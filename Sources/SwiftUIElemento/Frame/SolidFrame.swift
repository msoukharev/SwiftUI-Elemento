//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-06.
//

import SwiftUI


@available(iOS 13.0, *)
public struct SolidFrame<ClipShape: Shape>: FrameStyle {
    
    private var padding: EdgeInsets
    private var clipShape: ClipShape
    private var color: Color = Color.secondaryBackground
    
    public init(padding: EdgeInsets, color: Color, clipShape: ClipShape) {
        self.padding = padding
        self.clipShape = clipShape
    }
    
    public func body(content: Content) -> some View {
        return content.frameStyle(FrameModifier(padding: padding, background: color, clipShape: clipShape))
    }
}


public extension SolidFrame {
    
    init(clipShape: ClipShape) {
        self.init(padding: 15, color: Color.secondaryBackground, clipShape: clipShape)
    }
    
    init(padding: CGFloat = 15, color: Color, clipShape: ClipShape) {
        self.init(padding: EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding), color: color, clipShape: clipShape)
    }
}


struct SolidBackgroundFrame_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello world").frameStyle(SolidFrame(clipShape: Capsule()))
    }
}



