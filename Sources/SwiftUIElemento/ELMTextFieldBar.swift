//
//  SwiftUIView.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import SwiftUI

//@available(iOS 13.0, OSX 10.15, *)
//public struct ELMTextFieldBar: View {
//    
//    @ObservedObject var editor: ELMTextEditor
//    
//    var title: String
//    
//    var symbol: String?
//    
//    var submitLabel: String?
//    
//    var onSubmit: Optional<() -> Void>
//    
//    var onEditingChanged: Optional<(Bool) -> Void>
//    
//    var onCommit: Optional<() -> Void>
//    
//    public init(editor: ELMTextEditor,
//                title: String = "",
//                symbol: String? = nil,
//                submitLabel: String? = nil,
//                onSubmit: Optional<() -> Void> = nil,
//                onEditingChanged: Optional<(Bool) -> Void> = nil,
//                onCommit: Optional<() -> Void> = nil) {
//        
//        self.editor = editor
//        self.title = title
//        self.symbol = symbol
//        self.submitLabel = submitLabel
//        self.onSubmit = onSubmit
//        self.onEditingChanged = onEditingChanged
//        self.onCommit = onCommit
//        
//    }
//    
//    private var _symbol: Image? {
//        
//        guard let symbol = symbol else {
//            return nil
//        }
//        #if os(OSX)
//        return Image(symbol)
//        #else
//        return Image(systemName: symbol)
//        #endif
//        
//    }
//    
//    private var clearSymbol: Text {
//        
//        if !editor.isEmpty {
//            #if os(OSX)
//            return Text("􀁡")
//            #else
//            return Text(Image(systemName: "xmark.circle.fill"))
//            #endif
//        } else {
//            return Text("")
//        }
//    }
//    
//    public var body: some View {
//        
//        HStack {
//            
//            // Bar
//            ZStack {
//                // Bar background
//                RoundedRectangle(cornerRadius: 20).foregroundColor(Color.secondary.opacity(0.40))
//                
//                // Bar controls
//                HStack(spacing: 0) {
//                    
//                    // Symbol, if any
//                    if let symbol = _symbol {
//                        symbol.foregroundColor(.secondary).padding(.leading, 15)
//                            .padding(.trailing, 5)
//                    } else {
//                        EmptyView().padding(5)
//                    }
//                    
//                    //
//                    TextField(title, text: $editor.content, onEditingChanged: onEditingChanged ?? __nilEditChange, onCommit: onCommit ?? {}).padding(7)
//                    
//                    // Clear button
//                    clearSymbol
//                        .imageScale(.small)
//                        .padding(.horizontal, 15).foregroundColor(.secondary).onTapGesture(perform: editor.clear)
//                        .animation(nil)
//                    
//                }
//                
//            }
//            
//            // Submit button, if Any
//            if let submitLabel = submitLabel, let onSubmit = onSubmit, !editor.isEmpty {
//                Button(action: onSubmit) {
//                    Text(submitLabel)
//                }
//                .transition(.sideslide(.trailing))
//            }
//        }.animation(.easeIn(duration: 0.2)).frame(maxHeight: 40)
//        
//    }
//    
//    private var __nilEditChange: (Bool) -> Void = { _ in
//        Void()
//    }
//    
//}
//
//@available(iOS 13.0, OSX 10.15, *)
//struct ELMTextFieldBar_Previews: PreviewProvider {
//    static let editor = ELMTextEditor(content: "Initial content")
//    static var previews: some View {
//        ELMTextFieldBar(editor: self.editor, title: "Search", symbol: "magnifyingglass", submitLabel: "Cancel", onSubmit: {print("LF")}, onEditingChanged: nil, onCommit: nil)
//    }
//}

