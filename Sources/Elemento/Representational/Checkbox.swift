import SwiftUI


struct Checkbox: View {
    
    @Binding private var active: Bool
    private var label: Text?
    
    public init(active: Binding<Bool>, label: Text? = nil){
        self._active = active
        self.label = label
    }

    public init(active: Binding<Bool>, label: String? = nil){
        self._active = active
        if let label = label {
            self.label = Text(label)
        }
    }
    
    private var _boxSize: CGFloat {
        #if os(macOS)
        return 18
        #elseif os(iOS)
        return 24
        #endif
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            Button(action: {active.toggle()}, label: {
                Image(systemName: active ? "checkmark.square.fill" : "square").resizable().frame(size: _boxSize)
            }).buttonStyle(PlainButtonStyle()).foregroundColor(active ? .accentColor : .primary)
            if let label = label {
                label
            }
        }.animation(Animation.default.fast())
    
    }
    
}
