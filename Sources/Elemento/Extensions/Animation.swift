import SwiftUI


@available(iOS 13.0, macOS 11.0, *)
public extension Animation {
    
        
    func speed(_ speed: Self.Speed) -> Self {
        return self.speed(speed.rawValue)
    }
    
    func verySlow() -> Self {
        return self.speed(.verySlow)
    }
    
    func slow() -> Self {
        return self.speed(.slow)
    }
    
    func normal () -> Self {
        return self.speed(.normal)
    }
    
    func fast() -> Self {
        return self.speed(.fast)
    }
    
    func veryFast() -> Self {
        return self.speed(.veryFast)
    }

    enum Speed: Double {
        
        case verySlow = 0.7
        case slow = 0.85
        case normal = 1.0
        case fast = 2.0
        case veryFast = 4.0
        
    }
    
}
