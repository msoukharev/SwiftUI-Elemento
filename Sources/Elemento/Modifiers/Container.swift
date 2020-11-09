//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-08.
//

import SwiftUI


public protocol ContainerStyle: ViewModifier {}

public extension View {
    
    @ViewBuilder func container<Style: ContainerStyle>(_ style: Style) -> some View {
        self.modifier(style)
    }
    
}
