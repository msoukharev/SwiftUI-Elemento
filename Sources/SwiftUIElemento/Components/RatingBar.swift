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
public struct RatingBar: View {
    
    @Binding private var score: Int?
    private var symbol: String
    private var spacing: CGFloat = 25
    private var scale: CGFloat = 1.5
    
    public init(score: Binding<Int?>, symbol: String) {
        self._score = score
        self.symbol = symbol
    }
    
    public var body: some View {
        
        HStack(spacing: spacing) {
            ForEach(1..<6) { pos in
                let fill = (pos > score ?? 0) ? false : true
                Image(systemName: symbol, fill: fill)
                    .foregroundColor(fill ? .accentColor : .primary)
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
public extension RatingBar {
    
    /**
     Sets the scale factor relative to default. (Default is large image scale, 1.3 scale effect).
     */
    func scale(_ scale: CGFloat) -> RatingBar {
        var modified = self
        modified.scale = 1.5 * scale
        return modified
    }
    
    /**
     Sets the amount of spacing between the rating bar symbols. Minimum 25.0.
     */
    func spacing(_ spacing: CGFloat) -> RatingBar {
        var modified = self
        modified.spacing = max(25, spacing)
        return modified
    }
    
}

fileprivate struct Consumer: View {
    @State var score: Int? = nil
    
    var body: some View {
        VStack {
            RatingBar(score: $score, symbol: "star").scale(1.3).spacing(40).accentColor(.green)
            Text("\(self.score ?? -1)")
        }
    }
}

struct RatingBar_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
