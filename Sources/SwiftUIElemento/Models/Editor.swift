//
//  File.swift
//  
//
//  Created by Maxim Soukharev on 2020-10-09.
//

import Foundation
import Combine

protocol Editor: ObservableObject {
    associatedtype T
    
    var content: T { get set }
    
    init(content: T)
}

public class TextEditor: Editor {
    
    @Published var content: String {
        didSet {
            self.isEmpty = self.content.isEmpty
        }
    }
    
    @Published var isEmpty: Bool
    
    var onSubmit: Optional<() -> Void> = nil
    
    var onEditingChanged: Optional<() -> Void> = nil
    
    var onCommit: Optional<() -> Void> = nil
    
    required public init(content: String) {
        self.content = content
        self.isEmpty = content.isEmpty
    }
    
    public convenience init() {
        self.init(content: "")
    }
    
    public func clear() {
        self.content = ""
    }
    
    public func submit() {
        if let submit = self.onSubmit {
            submit()
        }
    }
    
    /// TODO: encapsulate textfield's editingChanged
//    public func editingChanged() {
//        if let editingChanged = self.onEditingChanged {
//            editingChanged()
//        }
//    }
    
    public func commit() {
        if let commit = self.onCommit {
            commit()
        }
    }
    
}
