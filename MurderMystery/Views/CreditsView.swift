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
                    VStack(alignment: .leading, spacing: 28) {
                        Text("Murder Mystery game was created by highness_ru.")
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Art:")
                                .bold()
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "photo")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Main Menu and Secondary Menu background art")
                                    
                                }
                            }
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "c.circle")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Link(
                                        "Fylgjur — Gothic GUI Image Pack",
                                        destination: URL(
                                            string: "https://www.deviantart.com/cospigeon/art/Gothic-GUI-Image-Pack-for-Ren-Py-584105366"
                                        )!
                                    )
                                    .foregroundStyle(.blue)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("App icon:")
                                .bold()
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "app")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("“Spooky house” icon by Delapouite")
                                    
                                    Link(
                                        "View original on Game-icons.net",
                                        destination: URL(
                                            string: "https://game-icons.net/1x1/delapouite/spooky-house.html"
                                        )!
                                    )
                                    .foregroundStyle(.blue)
                                }
                            }
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "c.circle")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Colours and presentation modified for Murder Mystery.")
                                    
                                    Link(
                                        "Licensed under CC BY 3.0",
                                        destination: URL(
                                            string: "https://creativecommons.org/licenses/by/3.0/"
                                        )!
                                    )
                                    .foregroundStyle(.blue)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Music:")
                                .bold()
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "music.note")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("“Darkest Night”, “Disintegrating” and “Fading” by Myuu")
                                    
                                    Link(
                                        "Myuu — The Dark Piano",
                                        destination: URL(
                                            string: "https://www.thedarkpiano.com/"
                                        )!
                                    )
                                    .foregroundStyle(.blue)
                                }
                            }
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "c.circle")
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Used under Myuu's non-commercial licensing terms.")
                                    
                                    Link(
                                        "CC BY-NC 3.0",
                                        destination: URL(
                                            string: "https://creativecommons.org/licenses/by-nc/3.0/"
                                        )!
                                    )
                                    .foregroundStyle(.blue)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Inspiration:")
                                .bold()
                            
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "lightbulb")
                                    .frame(width: 24)
                                
                                Text("orfac")
                            }
                        }
                    }
                    .modifier(DescriptionStyle())
                    .padding(.bottom, 12)
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
