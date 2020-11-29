import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public protocol ContainerStyle: ViewModifier {}

public extension View {
    
    @ViewBuilder func container<Style: ContainerStyle>(_ style: Style) -> some View {
        self.modifier(style)
    }
    
}
