//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-18.
//

import SwiftUI
import Introspect
import UIKit

@available (iOS 13.0, *)
public extension List {
    
    @ViewBuilder func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> some View {
        self.introspectTableView(customize: {
            $0.separatorStyle = style
        })
    }
    
    @ViewBuilder func separatorColor(_ color: UIColor) -> some View {
        self.introspectTableView(customize: {
            $0.separatorColor = color
        })
    }
    
}
