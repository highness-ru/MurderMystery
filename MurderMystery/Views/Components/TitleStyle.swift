import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(10)
    }
}
