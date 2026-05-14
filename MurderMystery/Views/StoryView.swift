import SwiftUI
struct StoryView: View {
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    @ObservedObject var story: StoryViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text("Chapter \(story.currentScene.id+1): \(story.currentScene.name)")
                        .modifier(TitleStyle())
                }
                
                VStack {
                    ScrollView(showsIndicators: true) {
                        Text("\(story.currentScene.description)")
                            .modifier(DescriptionStyle())
                    }
                }
                .modifier(DescriptionBoxStyle())
                
                ForEach(story.currentScene.choices) { choice in
                    Button {
                        story.choose(choice)
                    } label: {
                        ButtonStyle1("\(choice.title)")
                    }
                    
                }
                
            }
            .screenBackground("Secondary_Menu")
        }
        .fullScreenCover(
            isPresented: Binding(
                get: {
                    story.selectedConsequence != nil
                },
                set: { newValue in
                    if newValue == false {
                        story.continueAfterConsequence()
                    }
                }
            )
        ) {
            if let consequence = story.selectedConsequence {
                ConsequenceView(text: consequence) {
                    story.continueAfterConsequence()
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
    }
}

#Preview {
    StoryView(story: StoryViewModel())
}
