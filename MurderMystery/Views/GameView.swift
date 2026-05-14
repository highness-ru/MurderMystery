import SwiftUI

struct GameView: View {
    @StateObject private var story = StoryViewModel()
    
    var body: some View {
        if story.isEnding {
            EndingView(story: story)
        } else {
            StoryView(story: story)
        }
    }
}

#Preview {
    GameView()
}
