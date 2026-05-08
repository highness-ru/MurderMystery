import SwiftUI

struct GameView: View {
    @StateObject private var story = StoryViewModel()
    
    var body: some View {
        if story.isEnding {
            EndingView()
        } else {
            StoryView()
        }
    }
}

#Preview {
    GameView()
}
