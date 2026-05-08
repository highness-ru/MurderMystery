import SwiftUI

struct BackgroundStyle: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
            content
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
    }
}
