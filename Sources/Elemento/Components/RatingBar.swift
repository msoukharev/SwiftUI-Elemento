import SwiftUI


/**
 A rating bar, to set up a rating from 1 to 5.
 
 The decision to limit the rating range is motivated by an optimal user experience. The symbols should be large enough for user to be able to tap on them. At the same time, the rating bar should be able to fit on smaller devices such as an iPhone.
 */
@available(iOS 13.0, macOS 11.0, *)
public struct RatingBar: View {
    
    @Binding private var value: Int?
    private var symbol: String
    private var spacing: CGFloat = 25
    #if os(iOS)
    private var size: CGFloat = 30
    private var _min_size: CGFloat { return 30 }
    #elseif os(macOS)
    private var size: CGFloat = 20
    private var _min_size: CGFloat { return 20 }
    #endif
    public init(value: Binding<Int?>, symbol: String) {
        self._value = value
        self.symbol = symbol
    }
    
    public var body: some View {
        
        HStack(spacing: spacing) {
            ForEach(1..<6) { pos in
                let fill = (pos > value ?? 0) ? false : true
                Image(systemName: symbol, fill: fill)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(fill ? .accentColor : .primary)
                    .onTapGesture {
                    withAnimation(.easeIn(duration: 0.25)) {
                        self.value = pos
                    }
                }
                
            }
        }.padding()
        
    }
    
}


@available(iOS 13.0, macOS 11.0, *)
public extension RatingBar {
    
    /**
     Sets the scale factor relative to default. (Default is large image scale, 1.3 scale effect).
     */
    func size(_ size: CGFloat) -> RatingBar {
        var modified = self
        modified.size = max(self._min_size, size)
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


@available(iOS 13.0, macOS 11.0, *)
fileprivate struct Consumer: View {
    @State var score: Int? = nil
    
    var body: some View {
        VStack {
            RatingBar(value: $score, symbol: "star").accentColor(.green)
        }
    }

}


@available(iOS 13.0, macOS 11.0, *)
struct RatingBar_Previews: PreviewProvider {
    
    static var previews: some View {
        Consumer().modifier(Rounding.small.concat(Padding.init(horizontal: .medium, vertical: .large).concat(BackgroundColor.secondary)))
    }
    
}
