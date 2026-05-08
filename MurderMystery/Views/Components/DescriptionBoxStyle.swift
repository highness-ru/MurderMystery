import SwiftUI

struct DescriptionBoxStyle: ViewModifier {
    let width: CGFloat
    
    func body(content: Content) -> some View {
            content
                .padding(22)
                .frame(width: width - 48)
                .frame(maxHeight: 550)
                .background(Color.black.opacity(0.72))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
