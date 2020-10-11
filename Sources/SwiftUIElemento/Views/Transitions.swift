//
//  Transitions.swift
//  SwiftUIElemento
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import SwiftUI

extension AnyTransition {
    
    @available(iOS 13.0, OSX 10.15, *)
    public static func sideslide(_ edge: Edge) -> AnyTransition {
        return AnyTransition.asymmetric(insertion: .move(edge: edge), removal: .move(edge: edge))
    }
    
}
