//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct FillableSymbol: View {
    
    private var filled: Bool
    
    private var symbol: String
    
    public init(_ symbol: String, filled: Bool = false) {
        self.filled = filled
        self.symbol = symbol
    }
    
    
    public var body: Image {
        
        let bareSymbolName = symbol.replacingOccurrences(of: ".fill", with: "")
        if filled {
            return Image(systemName: bareSymbolName + ".fill")
        } else {
            return Image(systemName: bareSymbolName)
        }
        
    }
    
}

struct FillableSymbol_Previews: PreviewProvider {
    static var previews: some View {
        FillableSymbol("star", filled: true)
    }
}
