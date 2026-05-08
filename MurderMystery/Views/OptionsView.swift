import SwiftUI

struct OptionsView: View {
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
                        Text("Options")
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
    OptionsView()
}
