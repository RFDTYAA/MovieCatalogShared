import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public extension Color {
    struct theme {
        public static var accent = Color.yellow
        public static var background: Color {
            #if canImport(UIKit)
            return Color(UIColor.systemBackground)
            #else
            return Color(NSColor.windowBackgroundColor)
            #endif
        }
        
        public static var surface: Color {
            #if canImport(UIKit)
            return Color(UIColor.secondarySystemBackground)
            #else
            return Color(NSColor.underPageBackgroundColor)
            #endif
        }
        
        public static var primaryText = Color.primary
        public static var secondaryText = Color.secondary
    }
}
