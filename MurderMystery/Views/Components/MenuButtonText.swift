import Foundation
import SwiftUI

struct MenuButtonText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 240)
            .padding(.vertical, 16)
            .background(Color.black.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
