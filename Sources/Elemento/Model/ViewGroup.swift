import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public struct ViewGroup: View {
    
    @Environment var viewGroup: ViewGroupController
    
    public var body: some View {
    
        Group {
            viewGroup.activeView
        }
        
    }
    
}
