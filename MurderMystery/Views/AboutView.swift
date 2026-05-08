import SwiftUI
import AVFoundation

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Secondary_Menu")
                    .resizable()
                    .modifier(BackgroundStyle(width: geo.size.width, height: geo.size.height))
                
                VStack(spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("About")
                            .modifier(TitleStyle())
                    }
                    
                    ScrollView {
                        Text("""
                                This is a detective game where you play as a detective investigating a murder in an old mansion.
                                
                                During the game, you can choose between two options to see how the story unfolds.
                                
                                Choose wisely. Some choices can end the investigation early.
                                
                                There are several endings depending on the choices you make.
                                
                                Good luck.
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
    AboutView()
}
