import SwiftUI

struct EndingView: View {
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    @State private var story = StoryViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Secondary_Menu")
                    .resizable()
                    .modifier(BackgroundStyle(width: geo.size.width, height: geo.size.height))
                
                VStack(spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("\(story.currentScene.name)")
                            .modifier(TitleStyle())
                    }
                        ScrollView {
                            Text("""
                                \(story.currentScene.description)
                                """)
                            .modifier(DescriptionStyle())
                        }
                        .modifier(DescriptionBoxStyle(width: geo.size.width))
                        
                        Button {
                            dismiss()
                        } label: {
                            MenuButtonText("Back to Main Menu")
                        }
                    }
                }
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
        .ignoresSafeArea()
    }
}

#Preview {
    EndingView()
}
