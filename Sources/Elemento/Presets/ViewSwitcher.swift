//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-28.
//

import SwiftUI
import Foundation


@available(iOS 13.0, macOS 11.0, *)
public struct ViewSwitcher<K: Hashable & Equatable>: View {
    
    @Binding public var activeView: K
    public var views: Dictionary<K, AnyView>
    
    public var body: some View {
        
        Group {
            views[activeView] ?? AnyView(EmptyView())
        }
        
    }
    
}


@available(iOS 13.0, macOS 11.0, *)
public extension ViewSwitcher where K == Int {
    
    init(activeView: Binding<Int>, views: [AnyView]) {
        self._activeView = activeView
        self.views = Dictionary.init(
            uniqueKeysWithValues: views.enumerated().map(
                {($0.offset, $0.element)}
            )
        )
    }
    
}
