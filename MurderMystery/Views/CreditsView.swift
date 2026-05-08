import SwiftUI

struct CreditsView: View {
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
                        Text("Credits")
                        .modifier(TitleStyle())
                    }
                    
                    ScrollView {
                        Text("""
                             Murder Mystery game was created by highness_ru.
                            
                            Art
                            
                            Main Menu and Secondary Menu background art: Fylgjur (https://www.deviantart.com/cospigeon)
                            
                            Music
                            
                            "Darkest Night", "Disintegrating", "Fading" by Myuu
                            Licensed under CC BY NC 3.0
                            Source: https://creativecommons.org/licenses/by-nc/3.0/
                            
                            Inspiration:
                            orfac
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
    CreditsView()
}
