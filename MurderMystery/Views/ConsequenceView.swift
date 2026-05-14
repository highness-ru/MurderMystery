import SwiftUI
struct ConsequenceView: View {
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    @State private var story = StoryViewModel()
    let text: String
    let onContinue: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                VStack(alignment: .leading) {
                    Text("Your decision led to the following outcome: ")
                        .modifier(TitleStyle())
                }
                
                VStack {
                    ScrollView(showsIndicators: true) {
                        Text(text)
                            .modifier(DescriptionStyle())
                    }
                }
                .modifier(DescriptionBoxStyle())
                
                Button {
                    onContinue()
                } label: {
                    ButtonStyle2("Continue Investigation")
                }
                
            }
            .screenBackground("Secondary_Menu")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ConsequenceView(text: """
        Ivan says Lord Grey was still alive shortly after breakfast and had ordered that no one disturb him.
        
        He also says he saw a woman in a dark veil near the west corridor before the body was found, though he assumed it was one of the guests.
        
        He becomes frightened and stops talking when Edith Grey enters the hall.
        """,
                    onContinue: {})
}
