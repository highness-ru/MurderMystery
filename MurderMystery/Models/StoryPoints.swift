import Foundation

struct StoryScene: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let choices: [StoryChoice]
}

struct StoryChoice: Identifiable, Hashable {
    let id: Int
    let title: String
    let consequence: String
    let effects: StoryEffects
    let nextSceneID: Int?
}

struct StoryEffects: Hashable {
    var clues: Int = 0
    var delay: Int = 0
    var wrongSuspicion: Int = 0
}

extension StoryScene {
    static let allScenes: [StoryScene] = [
        StoryScene(
            id: 0,
            name: "Arrival at Grey House",
            description: """
                    You arrive at Grey House just after noon, though the storm has made the sky look like it is already evening. The old mansion has been converted into a private hotel and was about to open its doors to its first guests. However, it does not feel welcoming at all. You have the feeling that you are entering a tomb.
                    
                    Rain beats ferociously against the windows. A nervous bell boy opens the door and nearly drops your suitcase when thunder shakes the hall. He tells you Lord Andrew Grey was found dead in his study less than two hours ago. The family is gathered inside, but nobody is allowed to leave until you have spoken to them.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Talk to the bell boy, Ivan",
                    consequence: """
                            Ivan says Lord Grey was still alive shortly after breakfast and had ordered that no one disturb him. According to him, Lord Grey seemed worried about something.
                            
                            Ivan also says he saw a woman in a dark veil near the west corridor before the body was found, though he assumed it was one of the guests. He becomes frightened and stops talking when Edith Grey enters the hall and asks you to follow her.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 1
                ),
                StoryChoice(
                    id: 1,
                    title: "Look around the entrance for clues",
                    consequence: """
                            You notice muddy footprints near the door, but they clearly belong to several people. More interestingly, there is a faint smell of expensive rose perfume near the staircase, strangely out of place among the damp coats and old wood.
                            
                            Before you can investigate further, Edith Grey approaches and asks you to follow her.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 1
                )
            ]
        ),
        
        StoryScene(
            id: 1,
            name: "Edith Grey's Welcome",
            description: """
                    Edith Grey leads you through a corridor lined with portraits of dead family heads. Her long dark purple dress is spotless, her voice controlled. She says Lord Andrew Grey was a difficult man, but his death has shattered the household.
                    
                    She claims she was in her sister-in-law room when the murder occurred, comforting Annie Grey. As she speaks, you notice she avoids looking toward the closed study door.
                    
                    She pauses and says, "Detective, I ask only that you spare this family unnecessary scandal."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask Edith directly about Lord Grey's enemies",
                    consequence: """
                            Edith says almost everyone in the house had reason to resent Lord Grey. Harry wanted money. Annie feared being disinherited. The servants feared dismissal.
                            
                            She carefully avoids speaking about herself until you press her. Then she says Lord Grey treated her with perfect civility. Her answer feels polished, as if she prepared it before you arrived.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 2
                ),
                StoryChoice(
                    id: 1,
                    title: "Remain silent and let Edith speak first",
                    consequence: """
                            Edith fills the silence by explaining the family history. She speaks of old betrayals, disputes over the future hotel, and rumors that Grey House is cursed by the Mourning Lady. She also mentions the death of her husband - Charlie, Andrew's youngest son, and how it strained the relationships within the family.
                            
                            It is dramatic, but not especially useful. She seems relieved that you do not interrupt her.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 2
                )
            ]
        ),
        
        StoryScene(
            id: 2,
            name: "The Murdered Lord",
            description: """
                    Lord Andrew Grey's body lies beside his writing desk. His head is wounded, and one hand is clenched around a torn scrap of black fabric. A heavy bronze statue has fallen near the fireplace. At first glance, it seems to be the murder weapon.
                    
                    The study window is locked from the inside. The door was also locked when the body was discovered, according to Edith. A fire burns low in the hearth, and several papers have been reduced to ash.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Examine the body closely",
                    consequence: """
                            You find bruising on Lord Grey's wrist, as if someone grabbed him during a struggle. The wound on his head is severe, but the blood pattern suggests he was struck near the desk, not by the fireplace where the statue lies.
                            
                            The statue may have been moved afterward.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 3
                ),
                StoryChoice(
                    id: 1,
                    title: "Examine the burned papers in the fireplace",
                    consequence: """
                            Most of the papers are destroyed, but one corner survives. It contains the phrase: "final amendment to my will."
                            
                            Someone burned legal papers in a hurry. You also notice a drop of red sealing wax on the hearthstone.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 3
                )
            ]
        ),
        
        StoryScene(
            id: 3,
            name: "The Locked Door",
            description: """
                    Mrs. Madison, the housekeeper, explains that Lord Grey's study door was locked when Edith called for help. Harry forced it open. The window was also locked.
                    
                    That is why some servants have started whispering that no living person could have killed him.
                    
                    The old key is still in the lock, on the inside of the door.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Inspect the lock and key",
                    consequence: """
                            The key has scratches around its shaft. You realize it could have been turned from outside using a thin wire or a duplicate tool.
                            
                            The locked-room mystery was staged.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 4
                ),
                StoryChoice(
                    id: 1,
                    title: "Ask Mrs. Madison about the ghost rumors",
                    consequence: """
                            Mrs. Madison says the Mourning Lady appears before tragedy. She tells you a long story about a betrayed bride who died in the west tower.
                            
                            It unsettles the servants, but gives you little solid evidence.
                            """,
                    effects: StoryEffects(delay: 1, wrongSuspicion: 1),
                    nextSceneID: 4
                )
            ]
        ),
        
        StoryScene(
            id: 4,
            name: "Harry Grey",
            description: """
                    You find Harry Grey in the library, drinking whisky with shaking hands. He does not pretend to mourn. He almost seems... relieved?
                    
                    He says his father was cruel, controlling, and enjoyed humiliating his children. Harry admits they argued that morning over money.
                    
                    "He was going to cut me off, said I was a disgrace to the family ever since his favourite son, Charlie, died so young," Harry says, he shakes his head and looks away. "But I did not kill my father. I only wished him dead, which last time I checked is not a crime."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Question Harry about the argument",
                    consequence: """
                            Harry says Lord Grey planned to change his will that very evening. The solicitor was expected after the storm passed.
                            
                            Harry also says Edith visited Lord Grey shortly before the argument and left looking pale.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 5
                ),
                StoryChoice(
                    id: 1,
                    title: "Accuse Harry of killing his father for the inheritance",
                    consequence: """
                            Harry becomes furious. He refuses to answer more questions and calls you a fool chasing the obvious suspect.
                            
                            You gain no proof, and the household becomes more guarded.
                            """,
                    effects: StoryEffects(delay: 1, wrongSuspicion: 1),
                    nextSceneID: 5
                )
            ]
        ),
        
        StoryScene(
            id: 5,
            name: "Annie's Fear",
            description: """
                    Annie Grey is found in the music room, sitting at the piano without playing. She says she heard raised voices in the study before the murder, but she cannot say whose voices they were.
                    
                    She keeps glancing toward the dark hallway that leads to the west wing.
                    
                    She whispers that the Mourning Lady was seen last night.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Calm Annie and ask what she really heard",
                    consequence: """
                            Annie admits she heard Lord Grey say, "You will not bleed this family any longer."
                            
                            Then she heard a woman answer, but the voice was low and controlled. Annie thought it might have been Edith, but she was too frightened to say so.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 6
                ),
                StoryChoice(
                    id: 1,
                    title: "Encourage Annie to talk about the Mourning Lady",
                    consequence: """
                            Annie tells you the ghost appears as a woman in black with a torn veil. She says the same figure was seen near the west corridor.
                            
                            The story matches Ivan's statement, but it may be a disguise rather than a ghost.
                            """,
                    effects: StoryEffects(wrongSuspicion: 1),
                    nextSceneID: 6
                )
            ]
        ),
        
        StoryScene(
            id: 6,
            name: "The Servants' Corridor",
            description: """
                    The servants' corridor runs behind the study and connects to the kitchen, laundry, and old service stairs. It is narrow, badly lit, and rarely used by family members or infrequent guests.
                    
                    You find Ivan there, arguing quietly with a maid. When he sees you, he goes pale.
                    
                    He says he has already told you everything, but his eyes move toward the laundry room.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Press Ivan about what he is hiding",
                    consequence: """
                            Ivan admits he found a torn black veil in the laundry basket and threw it behind the boiler because he feared being blamed.
                            
                            He thought it belonged to the ghost costume used for old hotel theatricals.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 7
                ),
                StoryChoice(
                    id: 1,
                    title: "Let Ivan go and search the corridor alone",
                    consequence: """
                            You find several old theatrical props in a storage cupboard, including masks, cloaks, and fake mourning veils.
                            
                            It proves someone could impersonate the Mourning Lady, but you miss Ivan's more specific evidence.
                            """,
                    effects: StoryEffects(clues: 1, delay: 1),
                    nextSceneID: 7
                )
            ]
        ),
        
        StoryScene(
            id: 7,
            name: "The Laundry Room",
            description: """
                    The laundry room is hot, damp, and full of steam. Behind the boiler, you find a torn black veil. Its edge matches the scrap clenched in Lord Grey's hand.
                    
                    It smells faintly of rose perfume.
                    
                    A maid tells you Edith often sends her mourning clothes here separately and insists they be washed by hand.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Keep the veil as evidence and question the maid",
                    consequence: """
                            The maid says Edith returned from the west corridor after the murder alarm was raised, even though Edith claimed she had been in the morning room the whole time.
                            
                            The maid is afraid to testify, but gives you the details.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 8
                ),
                StoryChoice(
                    id: 1,
                    title: "Take the veil to Edith immediately",
                    consequence: """
                            Edith looks at it for only a second before saying many women in the house own black veils.
                            
                            Her composure barely changes, but she quickly asks whether Harry has been questioned. Is she trying to redirect suspicion?
                            """,
                    effects: StoryEffects(clues: 1, delay: 1),
                    nextSceneID: 8
                )
            ]
        ),
        
        StoryScene(
            id: 8,
            name: "Dr. Engelson's Examination",
            description: """
                    Dr. Engelson arrives after being delayed by the storm. He examines the body with clinical detachment.
                    
                    He confirms Lord Grey died from a blow to the head, but he also notices a shallow cut on Lord Grey's palm and traces of ash under his fingernails.
                    
                    "He struggled with someone before he died. Not long, but fiercely."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask whether the bronze statue was truly the weapon",
                    consequence: """
                            Dr. Engelson says the statue is too clean on one side and too heavily bloodied on the other.
                            
                            It was probably used, but moved afterward. The murderer staged the room to make the attack seem more chaotic than it was.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 9
                ),
                StoryChoice(
                    id: 1,
                    title: "Ask whether Lord Grey could have fallen by accident",
                    consequence: """
                            Dr. Engelson gives you a cold look and says no. The wound angle proves a deliberate strike.
                            
                            The question wastes time, but it removes any doubt that this was murder.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 9
                )
            ]
        ),
        
        StoryScene(
            id: 9,
            name: "The Burned Will",
            description: """
                    You return to the study and search Lord Grey's desk more carefully. Inside a hidden drawer, you find an envelope addressed to his solicitor.
                    
                    The letter inside says Lord Grey intended to remove Edith's access to family funds and expose debts paid secretly from the hotel accounts.
                    
                    The letter is unsigned, but the meaning is clear: Edith had a motive.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Search for proof that Edith knew about the letter",
                    consequence: """
                            You find a broken piece of red sealing wax on the desk and remember the wax near the fireplace.
                            
                            The seal on the envelope was broken before Lord Grey died. Someone read it, panicked, and burned the will amendment.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 10
                ),
                StoryChoice(
                    id: 1,
                    title: "Take the letter to Harry and ask if he knew about it",
                    consequence: """
                            Harry says he knew Edith was in debt but did not know his father planned to expose her.
                            
                            He grows smug and says this proves Edith is guilty, but he offers no new proof.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 10
                )
            ]
        ),
        
        StoryScene(
            id: 10,
            name: "The Choice to Continue",
            description: """
                    The storm worsens. The bridge road has started to flood, and the local constable warns that if the killer tries to flee tonight, there may be only one safe route left: the old carriage road through the woods.
                    
                    You have enough suspicion to continue, but the household is exhausted.
                    
                    Edith suggests postponing the investigation until morning.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Continue the investigation tonight",
                    consequence: """
                            You refuse to pause. The killer is still in the house, and delay may give them time to destroy evidence or escape.
                            """,
                    effects: StoryEffects(),
                    nextSceneID: 11
                ),
                StoryChoice(
                    id: 1,
                    title: "End the investigation for the night",
                    consequence: """
                            You accept Edith's suggestion and allow the household to retire.
                            
                            By morning, the veil, the sealing wax, and Edith herself are gone.
                            """,
                    effects: StoryEffects(delay: 2),
                    nextSceneID: 102
                )
            ]
        ),
        
        StoryScene(
            id: 11,
            name: "The West Wing",
            description: """
                    The west wing is abandoned, used only for storage and old guest rooms. Dust covers the floor, except for a narrow path of fresh footprints.
                    
                    At the end of the corridor, an old door leads to the service stairs, which connect to the servants' corridor near the study.
                    
                    You also find a faint smear of rose-scented hand cream on the banister.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Follow the footprints to the service stairs",
                    consequence: """
                            The footprints show someone moved quickly from the study area to the west wing after the murder.
                            
                            This explains how the killer could appear as the Mourning Lady and vanish without passing through the main hall.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 12
                ),
                StoryChoice(
                    id: 1,
                    title: "Search the old guest rooms for the ghost",
                    consequence: """
                            You find old guest books, cracked mirrors, and theatrical costumes from a hotel masquerade night years ago.
                            
                            The atmosphere is frightening, but the search costs time and reveals little beyond confirming the ghost story can be faked.
                            """,
                    effects: StoryEffects(delay: 1, wrongSuspicion: 1),
                    nextSceneID: 12
                )
            ]
        ),
        
        StoryScene(
            id: 12,
            name: "Mrs. Madison's Secret",
            description: """
                    Mrs. Madison finally admits she has served the Grey family for thirty years and knows better than to believe every respectable face.
                    
                    She tells you Lord Grey had summoned Edith to the study that morning. He had discovered missing hotel funds.
                    
                    She says she did not speak earlier because Edith promised to protect the servants if the soon-to-be hotel changed hands.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask Mrs. Madison what Edith was wearing that morning",
                    consequence: """
                            Mrs. Madison says Edith wore a black veil at breakfast, claiming a headache from the storm light.
                            
                            Later, after the murder, the veil was gone.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 13
                ),
                StoryChoice(
                    id: 1,
                    title: "Ask Mrs. Madison about Harry's temper",
                    consequence: """
                            Mrs. Madison says Harry shouted often but was cowardly when truly challenged.
                            
                            He argued with his father, yes, but she doubts he had the nerve to kill him. This helps remove Harry as the killer, but does not directly trap Edith.
                            """,
                    effects: StoryEffects(clues: 1, delay: 1),
                    nextSceneID: 13
                )
            ]
        ),
        
        StoryScene(
            id: 13,
            name: "Edith's Room",
            description: """
                    You search Edith's room with Mrs. Madison as witness. The room is immaculate. Too immaculate.
                    
                    Her writing desk has been cleared, her fireplace recently swept, and her travel case lies open beneath the bed.
                    
                    Inside the case, you find gloves, money, and a timetable for the evening mail coach that stops near the old carriage road.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Search the fireplace and writing desk",
                    consequence: """
                            In the ashes, you find a half-burned note from a creditor threatening to expose Edith's debt.
                            
                            You also find red sealing wax matching the wax in Lord Grey's study.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 14
                ),
                StoryChoice(
                    id: 1,
                    title: "Search the travel case and wardrobe",
                    consequence: """
                            You find a mourning dress with a missing strip of black fabric at the sleeve.
                            
                            The torn edge resembles the scrap from Lord Grey's hand. Edith was preparing to flee.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 14
                )
            ]
        ),
        
        StoryScene(
            id: 14,
            name: "Final Accusation",
            description: """
                    Everyone gathers in the great hall as thunder rolls above the roof. Edith stands near the staircase, pale but composed. Harry demands that she be arrested. Annie cries silently. Ivan watches the doors.
                    
                    You must name the murderer before the storm clears and the killer has a chance to escape.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Accuse Edith Grey",
                    consequence: """
                            You explain the staged locked room, the burned will, the torn veil, the rose perfume, the service stairs, and Edith's plan to flee.
                            
                            Edith's expression remains calm until Ivan mentions seeing the veiled woman near the west corridor. Then she breaks and reaches for the door.
                            """,
                    effects: StoryEffects(),
                    nextSceneID: nil
                ),
                StoryChoice(
                    id: 1,
                    title: "Accuse Harry Grey or blame the Mourning Lady",
                    consequence: """
                            The household erupts. Harry denies everything, and Edith uses the confusion to vanish through the servants' passage.
                            
                            By the time you realize the mistake, the old carriage road is empty and the mail coach is gone.
                            """,
                    effects: StoryEffects(wrongSuspicion: 2),
                    nextSceneID: 102
                )
            ]
        ),
        
        StoryScene(
            id: 100,
            name: "The Culprit Caught",
            description: """
                    You accuse Edith Grey in the great hall and lay out the evidence piece by piece. The torn veil. The burned will. The staged lock. The rose perfume. The west-wing passage. The travel case hidden beneath her bed.
                    
                    Edith tries to remain dignified, but when Ivan confirms he saw her near the west corridor, she loses control and attempts to flee. You stop her before she reaches the servants' stairs. The constable arrests her as dawn breaks through the storm clouds.
                    
                    Lord Grey was murdered not by a ghost, nor by the obvious heir, but by someone who feared exposure more than death itself.
                    
                    The truth is recorded. Grey House will never fully recover, but justice arrives before the killer can escape.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 101,
            name: "The Truth Too Late",
            description: """
                    You accuse Edith Grey, and the evidence is strong enough to expose her. The household falls silent as each detail connects: the veil, the will, the rose perfume, and the false locked room.
                    
                    But you spent too long chasing ghost stories, family grudges, and useless gossip. Edith has already prepared her escape.
                    
                    As you speak, she slips away during a moment of panic. By the time you reach her room, the travel case is gone. By the time you reach the carriage road, only wheel tracks remain in the mud.
                    
                    You know the truth. You can prove the truth. But Edith Grey is gone.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 102,
            name: "The Wrong Shadow",
            description: """
                    The investigation collapses beneath suspicion and superstition. Perhaps Harry looked too guilty. Perhaps the Mourning Lady seemed too real. Perhaps the evidence was there, but you left it scattered in dark rooms and frightened conversations.
                    
                    By morning, Edith Grey is gone. The burned papers are destroyed completely. The torn veil disappears. The servants change their stories. Harry becomes the family scandal, Annie retreats into silence, and the Grey House gains one more ghost story.
                    
                    The official report names no murderer.
                    
                    Years later, guests still whisper that Lord Grey was killed by the Mourning Lady. Only you know the truth may have been human, ordinary, and real enough to touch.
                    """,
            choices: []
        )
    ]
}
