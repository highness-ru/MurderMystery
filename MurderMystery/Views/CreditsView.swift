import SwiftUI

struct CreditsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    var body: some View {
            ZStack {
                VStack(spacing: 24) {
                    
                    VStack(alignment: .leading) {
                        Text("Credits")
                            .modifier(TitleStyle())
                    }
                    
                    ScrollView(showsIndicators: true) {
                        Text("""
                            Murder Mystery game was created by highness_ru.
                            
                            Art:
                            🖼 Main Menu and Secondary Menu background art: Fylgjur (https://www.deviantart.com/cospigeon)
                            
                            Music:
                            🎹 "Darkest Night", "Disintegrating", "Fading" by Myuu
                            ©️ Licensed under CC BY NC 3.0: https://creativecommons.org/licenses/by-nc/3.0/
                            
                            Inspiration:
                            orfac
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
        .ignoresSafeArea()
    }
}

#Preview {
    CreditsView()
}
