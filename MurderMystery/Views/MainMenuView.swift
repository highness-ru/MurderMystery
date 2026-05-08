import SwiftUI

struct MainMenuView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    var body: some View {
        ZStack {
            Image("Main_Menu")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Murder Mystery")
                    .modifier(TitleStyle())
                
                NavigationLink {
                    GameView()
                } label: {
                    MenuButtonText("New Game")
                }
                
                NavigationLink {
                    AboutView()
                } label: {
                    MenuButtonText("About Game")
                }
                
                NavigationLink {
                    OptionsView()
                } label: {
                    MenuButtonText("Options")
                }
                
                NavigationLink {
                    CreditsView()
                } label: {
                    MenuButtonText("Credits")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            if !turnOffMusic {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Disintegrating")
            }
        }
        .onChange(of: turnOffMusic) { _, newValue in
            if newValue {
                AudioManager.shared.stopBackgroundMusic()
            } else {
                AudioManager.shared.playBackgroundMusic(named: "Myuu-Disintegrating")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        MainMenuView()
    }
}
