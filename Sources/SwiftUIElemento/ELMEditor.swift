//
//  File.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import Foundation
import Combine

/**
 ELMEditor defines an protocol to create editors.
 
 ELMTextEditor is one example of conforming types.
 */
@available(iOS 13.0, OSX 10.15, *)
protocol ELMEditor: ObservableObject {
    associatedtype T
    
    var content: T { get set }
    
    init(content: T)
}

/**
 ELMTextEditor encapsulates the behaviour of a typical text editor.
 */
@available(iOS 13.0, *)
public class ELMTextEditor: ELMEditor {
    
    @Published var content: String {
        didSet {
            self.isEmpty = self.content.isEmpty
        }
    }
    
    @Published var isEmpty: Bool
    
    @Published var isEditing: Bool = false
    
    required public init(content: String) {
        self.content = content
        self.isEmpty = content.isEmpty
    }
    
    public func clear() {
        self.content = ""
    }
    
    public func unfocus() {
        self.isEditing = true
    }
    
    public func focus() {
        self.isEditing = true
    }
    
}
