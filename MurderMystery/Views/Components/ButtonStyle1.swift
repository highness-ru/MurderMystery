import Foundation
import SwiftUI

struct ButtonStyle1: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.white)
            .lineLimit(nil)
            .frame(width: 300, height: 38)
            .padding(.vertical, 5)
            .background(Color.black.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
