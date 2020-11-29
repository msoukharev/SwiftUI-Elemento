import SwiftUI


@available(iOS 13.0, *)
public extension AnyTransition {
    
    static func sideSlide(_ edge: Edge) -> AnyTransition {
        return AnyTransition.asymmetric(insertion: .move(edge: edge), removal: .move(edge: edge))
    }
    
    static func slideInsertScaleDelete(appearFrom edge: Edge = .bottom, disappearScale: CGFloat = 0.7, withOpacity: Bool = true) -> AnyTransition {
        var insertion = AnyTransition.move(edge: edge)
        var deletion = AnyTransition.scale(scale: disappearScale, anchor: .center)
        if withOpacity {
            insertion = insertion.combined(with: .opacity)
            deletion = deletion.combined(with: .opacity)
        }
        return AnyTransition.asymmetric(insertion: insertion, removal: deletion)
    }

}



