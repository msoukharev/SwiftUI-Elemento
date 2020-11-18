import SwiftUI


@available(iOS 13.0, *)
public extension Button where Label == Image {
    
    init(symbol: String, action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: symbol)
        }
    }
    
}
