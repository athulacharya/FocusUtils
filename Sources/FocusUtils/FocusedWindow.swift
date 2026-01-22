import AppKit

public struct FocusedWindow {
    public let position: CGPoint
    public let size: CGSize
    
    public var center: CGPoint {
        CGPoint(x: position.x + size.width / 2, y: position.y + size.height / 2)
    }
    
    public static func current() -> FocusedWindow? {
        guard let frontApp = NSWorkspace.shared.frontmostApplication else { return nil }
        
        let appElement = AXUIElementCreateApplication(frontApp.processIdentifier)
        var focusedWindow: CFTypeRef?
        
        guard AXUIElementCopyAttributeValue(appElement, kAXFocusedWindowAttribute as CFString, &focusedWindow) == .success,
              let window = focusedWindow else { return nil }
        
        var position: CFTypeRef?
        var size: CFTypeRef?
        AXUIElementCopyAttributeValue(window as! AXUIElement, kAXPositionAttribute as CFString, &position)
        AXUIElementCopyAttributeValue(window as! AXUIElement, kAXSizeAttribute as CFString, &size)
        
        guard let pos = position, let sz = size else { return nil }
        
        var point = CGPoint.zero
        var dimensions = CGSize.zero
        AXValueGetValue(pos as! AXValue, .cgPoint, &point)
        AXValueGetValue(sz as! AXValue, .cgSize, &dimensions)
        
        return FocusedWindow(position: point, size: dimensions)
    }
    
    public static func warpCursorToCenter() {
        if let window = current() {
            CGWarpMouseCursorPosition(window.center)
        }
    }
}
