//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ELMCard<Content: View, MenuLabel: View, MenuContent: View>: View {
    
    private var title: String
    private var menu: Menu<MenuLabel, MenuContent>?
    private var content: () -> Content
    
    public init(title: String, menu: Menu<MenuLabel, MenuContent>, @ViewBuilder content: @escaping () -> Content) {
        
        self.title = title
        self.menu = menu
        self.content = content
    }
    
    public var body: some View {
        
        VStack {
            
            HStack {
                Text(title).font(.title2)
                Spacer()
                if let menu = menu {
                    menu
                } else {
                    EmptyView()
                }
            }
            
            content()
        }.modal(active: true) {
            Text("Hi").frameStyle(SolidFrame(clipShape: RoundedRectangle(cornerRadius: 10)))
        
        }
        
    }
    
}

fileprivate struct Consumer: View {
    
    let menu = Menu("Health") {
        Button("Press me") {
            print("Press me")
        }
        Button("Or press me") {
            print("or oress me")
        }
    }
    
    var body: some View {
        
        LazyVStack(spacing: 20) {
            ELMCard(title: "Health", menu: menu) {
                Text("Some dashboards would be nice")
            }.padding()
            
            ELMCard(title: "Health", menu: menu) {
                Text("Some dashboards would be nice")
            }.padding()
            
            ELMCard(title: "Other stuff health", menu: menu) {
                Text("Some dashboards would be nice")
                Text("Some dashboards would be nice")
                Text("Some dashboards would be nice")
                Text("Some dashboards would be nice")
                Text("Some dashboards would be nice")
            }.padding()
            
            
        }
        
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        Consumer()
            .preferredColorScheme(.dark)
    }
}
