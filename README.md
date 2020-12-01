# SwiftUI - Elemento

Elemento is an extension to SwiftUI framework. It encapsulates view logic from *View*, decouples *View* logic aspects from their representational aspects, provides additional View and ViewModifier structs, and defines a range of values for consistent view modifier values like padding, animation speed, etc.

## Motivation

SwiftUI can be used to build applications on all Apple platforms using a single codebase. It is intended to completely replace AppKit and UIKit in the future. SwiftUI, however, has some **limitations**

1. Low number of available UI components
2. View logic aspects, outside of Combine framework, is most often implemented in View components and thus, coupled to representational aspects. 

Elemento is designed to fix these limitations by extending SwiftUI and Combine stack.

## Implementation and Dependencies

Elemento is implemented using *almost* exclusively SwiftUI and Combine frameworks.

> The exception the extension to *Color* type, which uses AppKit and UIKit to provide different background colors missing from SwiftUI.

## Platforms

The package requires iOS 13.0, macOS 11.0, or later. During the future iterations, I forsee supporting the package for WatchOS as well.

## Getting started

Start using Elemento using Swift Package Manager. Use the address of the repository: https://github.com/msoukharev/SwiftUI-Elemento/.
