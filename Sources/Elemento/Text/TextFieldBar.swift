//
//  SwiftUIView.swift
//
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import SwiftUI


@available(iOS 13.0, *)
public struct TextFieldBar: View {

    @Binding private var text: String
    private var title: String
    private var onEditingChanged: Optional<(Bool) -> Void>
    private var onCommit: Optional<() -> Void>

    public init(title: String,
                text: Binding<String>,
                onEditingChanged: Optional<(Bool) -> Void> = nil,
                onCommit: Optional<() -> Void> = nil) {

        self._text = text
        self.title = title
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit

    }
    
    private var symbol: String?
    private var onSubmit: Optional<() -> Void> = nil
    private var submitLabel: String?
    
    
    public var body: some View {

        HStack {

            ZStack {

                HStack(spacing: 0) {

                    if let symbol = symbol {
                        Image(systemName: symbol).foregroundColor(.secondary).padding(.leading, 12)
                            .padding(.trailing, 1)
                    } else {
                        EmptyView().padding(5)
                    }

                    TextField(title, text: $text, onEditingChanged: onEditingChanged ?? __nilEditChange, onCommit: onCommit ?? {}).padding(5)

                    if !text.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                        .imageScale(.small)
                        .padding(.horizontal, 7).foregroundColor(.secondary).onTapGesture(perform: {text = ""})
                            .transition(AnyTransition.identity.animation(Animation.easeIn.delay(0.5)))
                    } else {
                        EmptyView()
                    }
                   

                }

            }

            // Submit button, if Any
            if let submitLabel = submitLabel, let onSubmit = onSubmit, !text.isEmpty {
                Button(action: onSubmit) {
                    Text(submitLabel)
                }.padding(.trailing, 10)
                .transition(.sideslide(.bottom))
            }
        }.animation(.easeIn(duration: 0.1)).frame(maxHeight: 40)
    }

    private var __nilEditChange: (Bool) -> Void = { _ in
        Void()
    }

}


@available(iOS 13.0, *)
extension TextFieldBar {
    
    func symbol(systemName: String) -> Self {
        var s = self
        s.symbol = systemName
        return s
        
    }
    
    func submit(label: String, action: @escaping () -> Void) -> Self {
        var s = self
        s.submitLabel = label
        s.onSubmit = action
        return s
        
    }
}


fileprivate struct Consumer: View {
    
    @State private var text: String = "Initial text"
    
    var body: some View {
        TextFieldBar(title: "MyTextField", text: $text).symbol(systemName: "at")
            .submit(label: "Cancel", action: {text = ""}).container(SolidContainer(padding: 5, color: Color.gray, clipShape: RoundedRectangle(cornerRadius: 30))).frame(width: 310, height: 200, alignment: .center)
    }
    
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        Consumer()
            .preferredColorScheme(.dark)

    }
}


