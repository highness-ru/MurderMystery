import Foundation
import SwiftUI

struct ButtonStyle2: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 250)
            .padding(.vertical, 16)
            .background(Color.black.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
