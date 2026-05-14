import SwiftUI

struct EndingView: View {
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    @ObservedObject var story: StoryViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            ZStack {
                VStack(spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        Text("Epilogue: \(story.currentScene.name)")
                            .modifier(TitleStyle())
                    }
                    ScrollView(showsIndicators: true) {
                        Text("""
                                \(story.currentScene.description)
                                """)
                        .modifier(DescriptionStyle())
                    }
                    .modifier(DescriptionBoxStyle())
                    
                    Button {
                        story.restart()
                    } label: {
                        ButtonStyle2("Restart Investigation")
                    }
                    Button {
                        dismiss()
                    } label: {
                        ButtonStyle2("Go to Main Menu")
                    }
                }
                .screenBackground("Secondary_Menu")
            }
        .onAppear {
            if !turnOffMusic {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Fading")
            }
        }
        .onChange(of: turnOffMusic) { _, newValue in
            if newValue {
                AudioManager.shared.stopBackgroundMusic()
            } else {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Fading")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EndingView(story: StoryViewModel())
}
