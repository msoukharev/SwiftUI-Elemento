//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-22.
//

import SwiftUI

@available(iOS 13.0, *)
extension Image {

    init(systemName: String, fill: Bool) {
        var name = systemName
        if !fill {
            name = name.replacingOccurrences(of: ".fill", with: "")
        }
        self.init(systemName: name)
    }

}

struct Image_Fill_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "star.fill", fill: false)
    }
}
