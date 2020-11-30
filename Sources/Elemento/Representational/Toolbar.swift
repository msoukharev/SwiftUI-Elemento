import SwiftUI


@available(iOS 13.0, macOS 14.0, *)
public struct Toolbar<K: Hashable & Identifiable>: View {
    
    @Binding public var activeView: K
    public var views: Dictionary<K, Button<Image>>
    
    public var body: some View {
        
        HStack {
            
            
        }
        
    }

}
//
//public extension Toolbar where K == Int {
//    
//    init(activeView: Binding<Int>, views: [AnyView]) {
//        self._activeView = activeView
//        self.views = Dictionary.init(
//            uniqueKeysWithValues: views.enumerated().map(
//                {($0.offset, $0.element)}
//            )
//        )
//    }
//    
//}
