import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    var body: some View {
            ZStack {
                VStack(spacing: 24) {
                    
                    VStack(alignment: .leading) {
                        Text("Settings")
                            .modifier(TitleStyle())
                    }
                    VStack {
                        Toggle("Turn Off Music", isOn: $turnOffMusic)
                            .padding()
                    }
                    .toggleStyle(.switch)
                    .modifier(DescriptionStyle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.72))
                    
                    
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
    SettingsView()
}
