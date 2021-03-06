import Foundation
import SwiftUI


#if os(iOS)
/**
 Creates a togglable label with a symbol and optional text. The text is shown when the label is loggled off and disappears when the label is toggled on.
 */
@available(iOS 13.0, *)
public struct SwitchLabel: View {
    
    @Binding private var active: Bool
    private var symbol: String
    private var label: String?
    private var mode: Self.Mode
    
    public init(symbol: String, active: Binding<Bool>, label: String? = nil, mode: SwitchLabel.Mode) {
        self._active = active
        self.symbol = symbol
        self.label = label
        self.mode = mode
    }
    
    public var body: some View {
        
        Button(action: {self.active.toggle()}) {
            
            HStack {
                Image(systemName: symbol, fill: active).imageScale(.medium).padding(2)
                
                if let label = label, mode.expanded(toggle: active) {
                    Text(label).transition(.sideSlide(.trailing)).padding(0)
                }
            }.foregroundColor(.primary).padding(8).background(active ? Color.accentColor : Color.secondaryBackground).clipShape(Capsule())
            .animation(.easeIn(duration: (self.mode == Mode.static) ? 0.05 : 0.15))
            
        }
        
        
    }
    
    public struct Mode: Equatable {
        
        private var expandSelected: Bool
        private var expandContracted: Bool
        
        private init(expandSelected: Bool, expandContracted: Bool) {
            self.expandSelected = expandSelected
            self.expandContracted = expandContracted
        }
        
        public static let `static` = Mode(expandSelected: true, expandContracted: true)
        public static let contract = Mode(expandSelected: false, expandContracted: true)
        public static let expand = Mode(expandSelected: true, expandContracted: false)
        
        func expanded(toggle: Bool) -> Bool {
            toggle ? expandSelected : expandContracted
        }
        
    }

}

#endif
