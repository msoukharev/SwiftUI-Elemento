import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public extension View {
    
    func frame(size: CGFloat) -> some View {
        return self.frame(width: size, height: size)
    }
    
    func styled<C: StyleConformance>(_ conformance: C) -> some View{
        return self.modifier(conformance)
    }
    
    func erased() -> AnyView {
        return AnyView(self)
    }
    
}
