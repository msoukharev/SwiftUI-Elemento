import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public protocol PresetModifier: ViewModifier {
    associatedtype P
    var parameter: P { get }
}


@available(iOS 13.0, macOS 11.0, *)
public struct Padding: PresetModifier {
    
    public var parameter: (horizontal: CGFloat, vertical: CGFloat)
    
    private init(horizontal: CGFloat, vertical: CGFloat){
        self.parameter = (horizontal, vertical)
    }
    
    public init(horizontal: Self.Value, vertical: Self.Value) {
        self.parameter = (horizontal.value, vertical.value)
    }
    
    public func body(content: Content) -> some View {
        return content.padding(.horizontal, parameter.horizontal).padding(.vertical, parameter.vertical)
    }
    
    public struct Value {
        
        internal var value: CGFloat
        
        private init(value: CGFloat) {
            self.value = value
        }
        
        public static let none = Value(value: 0)
        public static let small = Value(value: 7)
        public static let medium = Value(value: 15)
        public static let large = Value(value: 25)
    }
    
}


@available(iOS 13.0, macOS 11.0, *)
public struct BackgroundColor: PresetModifier {
    
    public var parameter: Color
    
    private init(color: Color){
        self.parameter = color
    }
    
    static let none = BackgroundColor(color: Color.clear)
    static let primary = BackgroundColor(color: Color.primaryBackground)
    static let secondary = BackgroundColor(color: Color.secondaryBackground)
    static let tertiary = BackgroundColor(color: Color.tertiaryBackground)
    
    public func body(content: Content) -> some View {
        return content.background(parameter)
    }
    
}


//@available(iOS 13.0, macOS 11.0, *)
//public struct Circular<S: Shape>: StyleConformance {
//
//    public var parameter: S
//
//    public func body(content: Content) -> some View {
//        return content.clipShape(parameter)
//    }
//
//}
//
//public extension Circular where S == Circle {
//
//    private init(){
//        parameter = Circle()
//    }
//
//    public var circle
//
//}


@available(iOS 13.0, macOS 11.0, *)
public struct Rounding: PresetModifier {
    
    public var parameter: CGFloat
    
    private init(corner: CGFloat){
        self.parameter = corner
    }
    
    static let none = Rounding(corner: 0)
    static let small = Rounding(corner: 7)
    static let medium = Rounding(corner: 15)
    static let large = Rounding(corner: 25)
    
    public func body(content: Content) -> some View {
        return content.clipShape(RoundedRectangle(cornerRadius: parameter))
    }
    
}

//@available(iOS 13.0, macOS 11.0, *)
//public struct Border: StyleConformance {
//
//    public var parameter: CGFloat
//
//    private init(width: CGFloat){
//        self.parameter = width
//    }
//
//    static let none = Border(0)
//
//    public func body(content: Content) -> some View {
//
//    }
//
//}
