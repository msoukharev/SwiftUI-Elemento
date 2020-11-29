import SwiftUI


#if canImport(UIKit)

import UIKit
@available(iOS 13.0, *)
public extension Color {
    
    static let primaryBackground = Self.init(UIColor.systemBackground)
    
    static let secondaryBackground = Self.init(UIColor.secondarySystemBackground)
    
    static let tertiaryBackground = Self.init(UIColor.tertiarySystemBackground)
    
}

#else

import AppKit
@available(macOS 11.0, *)
public extension Color {
    
    static let primaryBackground = Self.init(NSColor.windowBackgroundColor)
    
    static let secondaryBackground = Self.init(NSColor.windowBackgroundColor)
    
    static let tertiaryBackground = Self.init(NSColor.windowBackgroundColor)
    
}

#endif
