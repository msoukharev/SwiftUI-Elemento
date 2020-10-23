//
//  SwiftUIView.swift
//
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ELMTextField: View {

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

            // Bar
            ZStack {
                
                // Bar background
                RoundedRectangle(cornerRadius: 20).foregroundColor(Color.secondary.opacity(0.40))

                // Bar controls
                HStack(spacing: 0) {

                    // Symbol, if any
                    if let symbol = symbol {
                        Image(systemName: symbol).foregroundColor(.secondary).padding(.leading, 15)
                            .padding(.trailing, 5)
                    } else {
                        EmptyView().padding(5)
                    }

                    //
                    TextField(title, text: $text, onEditingChanged: onEditingChanged ?? __nilEditChange, onCommit: onCommit ?? {}).padding(7)

                    // Clear button
                    clearSymbol
                        .imageScale(.small)
                        .padding(.horizontal, 15).foregroundColor(.secondary).onTapGesture(perform: {text = ""})
                        .animation(nil)

                }

            }

            // Submit button, if Any
            if let submitLabel = submitLabel, let onSubmit = onSubmit, !text.isEmpty {
                Button(action: onSubmit) {
                    Text(submitLabel)
                }
                .transition(.sideslide(.trailing))
            }
        }.animation(.easeIn(duration: 0.2)).frame(maxHeight: 40)

    }

    private var __nilEditChange: (Bool) -> Void = { _ in
        Void()
    }
    
    private var clearSymbol: Image {

        if !text.isEmpty {
            return Image(systemName: "xmark.circle.fill")
        } else {
            return Image("")
        }
        
    }

}

@available(iOS 13.0, *)
extension ELMTextField {
    
    func barLabel(systemName: String) -> Self {
        
        var s = self
        s.symbol = systemName
        return s
        
    }
    
    func onSubmit(label: String, action: @escaping () -> Void) -> Self {
        
        var s = self
        s.submitLabel = label
        s.onSubmit = action
        return s
        
    }
    
}

