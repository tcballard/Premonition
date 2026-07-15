import SwiftUI

enum PremonitionDesign {
    static let popoverWidth: CGFloat = 480
    static let popoverMaximumHeight: CGFloat = 440
    static let diffMaximumHeight: CGFloat = 220

    enum Space {
        static let tight: CGFloat = 4
        static let compact: CGFloat = 8
        static let regular: CGFloat = 12
        static let section: CGFloat = 16
        static let expanded: CGFloat = 24
    }

    enum Shape {
        static let section: CGFloat = 6
    }

    enum Symbol {
        static let identity: CGFloat = 16
    }

    enum ColorRole {
        static let identitySurface = Color.primary.opacity(0.06)
        static let diffSurface = Color(nsColor: .textBackgroundColor)
        static let rationaleSurface = Color.primary.opacity(0.025)
        static let outline = Color(nsColor: .separatorColor)
    }
}
