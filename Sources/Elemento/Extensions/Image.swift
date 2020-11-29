import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public extension Image {

    init(systemName: String, fill: Bool) {
        let name = systemName.replacingOccurrences(of: ".fill", with: "")
        self.init(systemName: fill ? name + ".fill" : name)
    }
    
}
