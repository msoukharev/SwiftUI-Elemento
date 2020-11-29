import SwiftUI

struct Preview: View {
    
    @State private var text: String = ""
    @State private var switchView: Int = 1
    @State private var toggle1: Bool = false
    @State private var toggle2: Bool = false
    @State private var rating: Int? = 4
    var body: some View {
        
        VStack {
            
            Text("View Switcher").font(.title)
            
            ViewSwitcher(activeView: $switchView, views: [
                            VStack {
                                Text("View 0")
                                Text("View 0 has another line")
                            }.transition(.slide).erased(),
                Text("View 1").erased()
            ])
            
            Button(action: {switchView = (switchView + 1) % 2}, label: {
                Text("Switch views")
            })
            
            Text("Rating bar").font(.title)
            
            RatingBar(value: $rating, symbol: "star")
            
            Text("Checkbox").font(.title)
            
            Checkbox(active: $toggle1, label: "Toggle1")
            Checkbox(active: $toggle2, label: "Toggle1")
            
            Text("Checkbox").font(.title)
            
            SearchBar(placeholder: "Enter someting", text: $text, onEditChanged:  { toggle1 = $0 } ,onCommit: {toggle2.toggle()})
            
        }.frame(size: 400).animation(Animation.default.fast())
        
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview().preferredColorScheme(.light)
    }
}
