//
//  Transitions.swift
//  SwiftUIElemento
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import SwiftUI

@available(OSX 10.15, *)
extension AnyTransition {
    
    public static func sideslide(_ edge: Edge) -> AnyTransition {
        return AnyTransition.asymmetric(insertion: .move(edge: edge), removal: .move(edge: edge))
    }
    
}
