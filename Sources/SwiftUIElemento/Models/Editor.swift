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
}

public class TextEditor: Editor {
    
    @Published var content: String {
        didSet {
            self.isEmpty = self.content.isEmpty
        }
    }
    
    @Published var isEmpty: Bool
    
    public init(content: String) {
        self.content = content
        self.isEmpty = content.isEmpty
    }
    
    public func clear() {
        self.content = ""
    }
    
}
