import SwiftUI


public protocol ContainerStyle: ViewModifier {}


public extension View {
    
    @ViewBuilder func container<Style: ContainerStyle>(_ style: Style) -> some View {
        self.modifier(style)
    }
    
}
