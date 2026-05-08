import SwiftUI
struct StoryView: View {
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    @State private var story = StoryViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Secondary_Menu")
                    .resizable()
                    .modifier(BackgroundStyle(width: geo.size.width, height: geo.size.height))
                
                VStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Chapter \(story.currentScene.id+1): \(story.currentScene.name)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(15)
                    }
                    
                    VStack {
                        ScrollView {
                            Text("\(story.currentScene.description)")
                        }
                        .modifier(DescriptionStyle())
                    }
                    .modifier(DescriptionBoxStyle(width: geo.size.width))
                    
                    ForEach(story.currentScene.choices) { choice in
                        Button {
                            story.choose(choice)
                        } label: {
                            MenuButtonText("\(choice.title)")
                        }
                        
                    }
                    
                }
            }
        }
        .onAppear {
            if !turnOffMusic {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Darkest-Night")
            }
        }
        .onChange(of: turnOffMusic) { _, newValue in
            if newValue {
                AudioManager.shared.stopBackgroundMusic()
            } else {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Darkest-Night")
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    StoryView()
}
