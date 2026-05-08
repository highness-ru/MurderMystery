import Foundation
import Combine

final class StoryViewModel: ObservableObject {
    @Published private(set) var currentSceneID = 0
    @Published private(set) var clues = 0
    @Published private(set) var delay = 0
    @Published private(set) var wrongSuspicion = 0
    
    @Published var selectedConsequence: String?
    
    private var pendingNextSceneID: Int?
    private let scenes = StoryScene.allScenes
    
    var currentScene: StoryScene {
        scenes.first { $0.id == currentSceneID } ?? scenes[0]
    }
    
    var isEnding: Bool {
        currentScene.choices.isEmpty
    }
    
    func choose(_ choice: StoryChoice) {
        apply(choice.effects)
        selectedConsequence = choice.consequence
        
        if let nextSceneID = choice.nextSceneID {
            pendingNextSceneID = nextSceneID
        } else {
            pendingNextSceneID = determineEndingSceneID()
        }
    }
    
    func continueAfterConsequence() {
        guard let nextSceneID = pendingNextSceneID else {
            return
        }
        
        currentSceneID = nextSceneID
        selectedConsequence = nil
        pendingNextSceneID = nil
    }
    
    func restart() {
        currentSceneID = 0
        clues = 0
        delay = 0
        wrongSuspicion = 0
        selectedConsequence = nil
        pendingNextSceneID = nil
    }
    
    private func apply(_ effects: StoryEffects) {
        clues += effects.clues
        delay += effects.delay
        wrongSuspicion += effects.wrongSuspicion
    }
    
    private func determineEndingSceneID() -> Int {
        if clues >= 7 && delay <= 4 {
            return 100
        } else if clues >= 7 {
            return 101
        } else {
            return 102
        }
    }
}
