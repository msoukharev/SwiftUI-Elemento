//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-10.
//

import SwiftUI

/**
 A rating bar, to set up a rating from 1 to 5.
 
 The decision to limit the rating range is motivated by an optimal user experience. The symbols should be large enough for user to be able to tap on them. At the same time, the rating bar should be able to fit on smaller devices such as an iPhone.
 */
@available(iOS 13.0, *)
public struct ELMRatingBar: View {
    
    @Binding private var score: Int?
    private var symbol: String
    private var spacing: CGFloat? = 20
    private var scale: CGFloat = 1.3
    
    public init(score: Binding<Int?>, symbol: String) {
        self._score = score
        self.symbol = symbol
    }
    
    public var body: some View {
        
        HStack(spacing: spacing) {
            ForEach(1..<6) { pos in
    
                Image(systemName: symbol, fill:
                                  (pos > score ?? 0) ? false : true)
                    .scaleEffect(scale)
                    .onTapGesture {
                    withAnimation(.easeIn(duration: 0.25)) {
                        self.score = pos
                    }
                }
                
            }
        }
        
    }
    
}

@available(iOS 13.0, *)
public extension ELMRatingBar {
    
    /**
     Sets the scale factor relative to default. (Default is large image scale, 1.3 scale effect).
     */
    func scale(_ scale: CGFloat) -> ELMRatingBar {
        var modified = self
        modified.scale = 1.3 * scale
        return modified
    }
    
    /**
     Sets the amount of spacing between the rating bar symbols. Minimum 25.0.
     */
    func spacing(_ spacing: CGFloat) -> ELMRatingBar {
        var modified = self
        modified.spacing = max(20, spacing)
        return modified
    }
    
}

fileprivate class Consumer: ObservableObject {
    @Published var score: Int?
}
