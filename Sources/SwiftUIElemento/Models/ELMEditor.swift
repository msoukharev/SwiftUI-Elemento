//
//  File.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import Foundation
import Combine

protocol ELMEditor: ObservableObject {
    associatedtype T
    
    var content: T { get set }
    
    init(content: T)
}

public class ELMTextEditor: ELMEditor {
    
    @Published var content: String {
        didSet {
            if let onChange = self.onChange {
                onChange(oldValue)
            }
            self.isEmpty = self.content.isEmpty
        }
    }
    
    @Published var isEmpty: Bool
    
    var onChange: Optional<(String) -> Void>
    
    var onReturn: Optional<(String) -> Void>
    
    var onCancel: Optional<(String) -> Void>
    
    required public init(content: String) {
        self.content = content
        self.isEmpty = content.isEmpty
    }
    
    public convenience init() {
        self.init(content: "")
    }
    
    public convenience init(content: String, onSubmit: @escaping () -> Void) {
        self.init(content: content)
        self.onSubmit = onSubmit
    }
    
    public convenience init(content: String, onCommit: @escaping () -> Void) {
        self.init(content: content)
        self.onCommit = onCommit
    }
    
    public convenience init(content: String, onSubmit: @escaping () -> Void, onCommit: @escaping () -> Void) {
        self.init(content: content, onSubmit: onSubmit)
        self.onCommit = onCommit        
    }
    
    public func clear() {
        self.content = ""
    }
    
}
