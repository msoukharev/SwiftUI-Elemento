import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
struct SearchBar: View {
    
    @Binding private var text: String
    private var placeholder: String
    private var onEditChanged: (Bool) -> Void
    private var onCommit: () -> Void
    
    public init(
        placeholder: String,
        text: Binding<String>,
        onEditChanged: @escaping (Bool) -> Void = {_ in},
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        self._text = text
        self.onEditChanged = onEditChanged
        self.onCommit = onCommit
    }
    
    public var body: some View {

        HStack {

            ZStack {

                HStack(spacing: 0) {

                    ZStack {
                        
                        Image(systemName: "magnifyingglass").foregroundColor(.secondary).padding(.leading, 12)
                            .padding(.trailing, 1)
                
                        #if os(iOS)
                        TextField(placeholder, text: $text, onEditingChanged: onEditChanged, onCommit: onCommit)
                            .padding(10)
                        #elseif os(macOS)
                        TextField(placeholder, text: $text, onEditingChanged: onEditChanged, onCommit: onCommit).textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(10).clipShape(Capsule()).onExitCommand(perform: {
                                clear()
                                onCommit()
                            })
                        #endif
                                        
                    }
                    
                    if !text.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                        .imageScale(.small)
                        .padding(.horizontal, 7).foregroundColor(.secondary).onTapGesture(perform: clear)
                            .transition(AnyTransition.identity.animation(Animation.easeIn.delay(0.5)))
                    } else {
                        EmptyView()
                    }
                   

                }

            }

            #if os(iOS)
            if !text.isEmpty {
                Button(action: clear) {
                    Text("Cancel")
                }.padding(.trailing, 10)
                .transition(.sideSlide(.trailing))
            }
            #endif
            
        }.animation(.easeIn(duration: 0.1)).frame(maxHeight: 40)
        
    }
    
    private func clear() {
        self.text = ""
    }
    
}


fileprivate struct Consumer: View {
    
    @State private var query = ""
    
    var body: some View {
        SearchBar(placeholder: "Enter info", text: $query)
    }
    
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
    }
}
