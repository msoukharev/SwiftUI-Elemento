//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-10.
//

import SwiftUI

@available(iOS 13.0, *)
struct ELMRatingBar: View {
    
    struct InvalidValueError: Error {}
    
    @Binding var score: Int?
    var outOf: Int = 5
    var fillColor: Color
    
    public init(score: Binding<Int?>, fillColor: Color) throws {
        
        try! self.init(score: score, outOf: 5, fillColor: fillColor)
    }
    
    public init(score: Binding<Int?>, outOf: Int, fillColor: Color) throws {
        if let __score = score.wrappedValue, outOf < __score || outOf < 1 || __score < 1 {
            print("Invalid values")
            throw InvalidValueError()
        }
        self._score = score
        self.outOf = outOf
        self.fillColor = fillColor
    }
    
    private func starImage(pos: Int) -> some View {
        
        var symbol: String
        if let score = score, pos <= score {
            symbol = "star.fill"
        } else {
            symbol = "star"
        }
        
        return Image(systemName: symbol).antialiased(true).imageScale(.large).foregroundColor(fillColor).scaleEffect(1)
        
    }
    
    public var body: some View {
    //
        HStack(spacing: 35) {
            
            ForEach(1..<(outOf+1)) { pos in
                
        
                starImage(pos: pos).onTapGesture {
                    withAnimation(.easeIn(duration: 0.25)) {
                        self.score = pos
                    }
                }
                
            }
            
        }
    //
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    
    private struct ConsumerView: View {
        @ObservedObject var consumer = Consumer()
        
        var body: some View {
            try! ELMRatingBar(score: $consumer.score, outOf: 7, fillColor: .red)
        }
    }
    
    static var previews: some View {
        ConsumerView()
    }
}

fileprivate class Consumer: ObservableObject {
    @Published var score: Int?
}
