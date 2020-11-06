//
//  File.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-06.
//

import SwiftUI

public extension View {
    
    @ViewBuilder func frameStyle<Style: FrameStyle>(_ style: Style) -> some View {
        self.modifier(style)
    }
    
}
