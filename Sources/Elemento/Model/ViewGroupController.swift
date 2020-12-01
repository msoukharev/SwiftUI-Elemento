import SwiftUI
import Combine


@available(iOS 13.0, macOS 11.0, *)
public class ViewGroupController: ObservableObject {
    
    public init(views: Dictionary<String, AnyView>, activeView: String? = nil) {
        self.views = views
        if let _activeView = activeView {
            self.activeView = views[_activeView]!
        } else {
            self.activeView = EmptyView().erased()
        }
    }
    
    private var views: Dictionary<String, AnyView>
    @Published private(set) var activeView: AnyView
    
    public func activate(_ key: String) {
        self.activeView = self.views[key] ?? self.activeView
    }
    
    public func setEmpty() {
        self.activeView = EmptyView().erased()
    }
    
}
