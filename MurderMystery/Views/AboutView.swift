import SwiftUI
import AVFoundation

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    var body: some View {
            ZStack {
                VStack(spacing: 24) {
                    
                    VStack(alignment: .leading) {
                        Text("About Game")
                            .modifier(TitleStyle())
                    }
                    
                    ScrollView(showsIndicators: true) {
                        Text("""
                                This is a detective game where you play as a detective investigating a murder in an old mansion.
                                
                                During the game, you can choose between two options to see how the story unfolds.
                                
                                Choose wisely. Some choices can end the investigation early. There are several endings depending on the choices you make.
                                
                                If you see a box like this, it is scrollable, so make sure you scroll it before you continue to catch all important details.
                                
                                Good luck!
                                """)
                        .modifier(DescriptionStyle())
                        
                    }
                    .modifier(DescriptionBoxStyle())
                    
                    
                    Button {
                        dismiss()
                    } label: {
                        ButtonStyle2("Back to Main Menu")
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
    AboutView()
}
