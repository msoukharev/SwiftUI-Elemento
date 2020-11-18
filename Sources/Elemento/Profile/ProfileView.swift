//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-11-09.
//

import SwiftUI


@available(iOS 13.0, *)
public struct ProfileView<Content: View>: View {
    
    private var image: Image
    private var name: Text
    private var content: () -> Content
    
    public init(image: Image, name: Text, @ViewBuilder content: @escaping () -> Content) {
        self.image = image
        self.name = name
        self.content = content
    }
    
    private var _style: Self.Style = .horizontal
    private var _pictureDimension: CGFloat? = 72
    
    public var body: some View {
        
        return Group {
            switch (_style) {
                
                case Style.vertical:
                    VStack() {
                        self.image.resizable().aspectRatio(1, contentMode: .fit).clipShape(Circle()).frame(width: _pictureDimension, height: _pictureDimension)
                        name
                        content()
                    }
                case Style.horizontal:
                    HStack {
                        self.image.resizable().aspectRatio(1, contentMode: .fit).clipShape(Circle()).frame(width: _pictureDimension, height: _pictureDimension)
                        VStack {
                            name
                            content()
                        }
                    }
            }
        }
    }
    
    public enum Style {
        case vertical
        case horizontal
    }
}


@available(iOS 13.0, *)
public extension ProfileView {
    
    init(image: String, name: String, @ViewBuilder content: @escaping () -> Content) {
        self.init(image: Image(image), name: Text(name).font(.headline), content: content)
    }
    
}


@available(iOS 13.0, *)
public extension ProfileView {
    
    func imageFrame(dimension: CGFloat) -> Self {
        var s = self
        s._pictureDimension = dimension
        return s
    }
    
}

@available(iOS 13.0, *)
public extension ProfileView {
    
    func profileStyle(_ style: Self.Style) -> Self {
        var s = self
        s._style = style
        return s
    }
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ProfileView(image: Image(systemName: "star"), name: Text("John Johnson").font(.title2)) {
                Text("Phone number: 111-111-1111")
            }.profileStyle(.vertical).container(SolidContainer(clipShape: RoundedRectangle(cornerRadius: 20)))
        }.preferredColorScheme(.dark)
    }
}
