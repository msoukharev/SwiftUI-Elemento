//
//  File.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-18.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Button where Label == Image {
    
    init(symbol: String, action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: symbol)
        }
    }
    
}

