import SwiftUI


@available(iOS 13.0, *)
extension AnyTransition {
    
    static func sideslide(_ edge: Edge) -> AnyTransition {
        return AnyTransition.asymmetric(insertion: .move(edge: edge), removal: .move(edge: edge))
    }
    
}
