import Foundation
import SwiftUI
import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    @AppStorage("iSMusicOff") private var turnOffMusic = false
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playBackgroundMusic(named fileName: String, fileExtension: String = "mp3") {
        guard !turnOffMusic else {
            stopBackgroundMusic()
            return
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Error: Music file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error: Could not play sound - \(error.localizedDescription)")
        }
    }
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
