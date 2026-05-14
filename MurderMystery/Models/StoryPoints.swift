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
                    You arrive at Grey House just after noon, though the storm has made the sky look like it is already evening. The old mansion has been converted into a private hotel and was about to open its doors to its first guests. However, the grand opening might be delayed as you were called to investigate a murder.
                    
                    You are grateful when a nervous bellboy opens the door for you. As you watch water endlessly dripping from your coat, he tells you Lord Andrew Grey was found dead in his study less than two hours ago. The family is gathered inside, but nobody is allowed to leave until you have spoken to them.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Talk to the bellboy, Ivan",
                    consequence: """
                            Ivan says Lord Grey was still alive shortly after breakfast and had ordered that no one disturb him. According to him, Lord Grey seemed worried about something.
                            
                            Ivan also says he saw a woman in a dark veil near the west corridor before the body was found, he suspects it could have been the Mourning Lady but doesn't offer any explanation, as he is interrupted when Edith Grey enters the hall and asks you to follow her.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 1
                ),
                StoryChoice(
                    id: 1,
                    title: "Look around the entrance for clues",
                    consequence: """
                            You notice muddy footprints near the door, but they clearly belong to several people. 
                            
                            Before you can investigate further, Edith Grey approaches and asks you to follow her.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 1
                )
            ]
        ),
        
        StoryScene(
            id: 1,
            name: "Edith Grey's Welcome",
            description: """
                    Edith Grey leads you through a corridor lined with portraits of dead family heads. Her long dark purple dress is spotless, her voice controlled. She says Lord Andrew Grey had his flaws. He was strict, controlling, and often argued with his children, yet his death has shattered the entire household. Since the death of Charlie, Lord Grey's youngest son and Edith's husband, Grey House has been the only home left to her.
                    
                    She says she spent much of the late morning with Annie Grey, who had been frightened by the storm and by talk of the Mourning Lady. Edith briefly looks at the study door. When she turns back, her face is composed again, but her fingers have tightened around her sleeve.
                    
                    Before leading you onward, Edith quietly asks a maid to bring tea for Annie and the servants. "Nerves make people careless," she says.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask Edith directly about Lord Grey's enemies",
                    consequence: """
                            Edith says almost everyone in the house had reason to resent Lord Grey. Harry wanted money. Annie feared being disinherited. The servants feared dismissal.
                            
                            She carefully avoids speaking about herself until you press her. Then she says Lord Grey was not cruel to her, exactly. He offered her home after Charlie died, and that sort of debt is difficult to speak of plainly.
                            
                            She gives the answer too smoothly, then looks annoyed with herself for doing so.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 2
                ),
                StoryChoice(
                    id: 1,
                    title: "Remain silent and let Edith speak first",
                    consequence: """
                            Edith fills the silence by explaining the family history. She speaks of old betrayals, disputes over the future hotel, and rumours that the Grey House is cursed by the Mourning Lady. She also mentions the death of her husband, Charlie, Andrew's youngest son. Since Charlie died, Edith has remained at Grey House as a widow dependent on Lord Grey's allowance.
                            
                            She says this dependence strained every relationship in the family.
                            
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
                    Mrs. Madison, the family cook, explains that Lord Grey's study door was locked when Edith called for help. Harry forced it open. The window was also locked.
                    
                    That is why some servants have started whispering that no living person could have killed him.
                    
                    The old key is still in the lock, on the inside of the door. The door is warped enough to leave a narrow gap above the floorboards. Beneath it, the dust shows a few thin scratches, almost too neat to be accidental.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Inspect the lock and key",
                    consequence: """
                            The key has scratches around its shaft, and the marks beneath the door line up with the keyhole. Someone slid a thin wire or hooked tool through the gap beneath the door, caught the bow of the key, and turned it from the outside. It would not require strength, only patience and something narrow enough to bend.
                            
                            The key was left inside deliberately. The locked-room mystery was staged.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 4
                ),
                StoryChoice(
                    id: 1,
                    title: "Indulge Mrs. Madison's ghost rumours",
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
                    You find Harry Grey in the library, drinking whisky with shaking hands. He does not pretend to mourn. He almost seems relieved, and hates himself for it.
                    
                    He says his father was cruel, controlling, and enjoyed humiliating his children. Harry admits they argued that morning over money.
                    
                    There is a dark stain on one of his cuffs, and a shallow scratch across the back of his hand. When he notices you looking, he folds his arm across both too quickly.
                    
                    "He was going to cut me off," Harry mutters bitterly. "Said I was a disgrace to the family, especially after Charlie died and left this place full of widows and debts." He looks toward the study door, then away. "I hated him. I will not pretend otherwise."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Question Harry about the argument",
                    consequence: """
                            Harry says Lord Grey planned to change his will that evening. The solicitor was expected after the storm passed.
                            
                            When you ask about the stain and the scratch, Harry says both came from helping force open the study door and kneeling near the body. He sounds ashamed rather than frightened, but his explanation arrives a little too quickly.
                            
                            He also says someone visited Lord Grey shortly before the argument. Harry heard a woman's voice, but not clearly enough to name it. In this house, he says, everyone whispers when money is mentioned.
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
                    Annie Grey, Lord Grey's anxious daughter, is found in the music room, sitting at the piano without playing. She says she heard raised voices in the study before the murder, but she cannot say whose voices they were.
                    
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
                            
                            Then she heard a woman answer, but the voice was low and controlled. Annie thought it sounded familiar, then doubted herself at once. The storm was loud and she was too scared to listen attentively.
                            
                            During the confusion after the alarm was raised, a calm voice told Annie not to repeat uncertain things in a house already half-mad with fear. Annie cannot remember the exact words now, only that obedience felt safer than doubt.
                            
                            Annie looks ashamed when she admits this. "I think I wanted to convince myself it was a ghost," her voice falters. "Because I was scared it wasn't."
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 6
                ),
                StoryChoice(
                    id: 1,
                    title: "Focus on the Mourning Lady",
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
                    The servants' corridor runs behind the study and connects to the kitchen, laundry, and old service stairs. It is narrow, badly lit, and rarely used by family members or visitors.
                    
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
                            
                            He thought it belonged to the old costumes kept for family theatricals.
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
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 7
                )
            ]
        ),
        
        StoryScene(
            id: 7,
            name: "The Laundry Room",
            description: """
                    The laundry room is hot, damp, and full of steam. Behind the boiler, you find a torn black veil. Its edge matches the scrap clenched in Lord Grey's hand.
                    
                    A maid tells you some of the household’s mourning clothes are washed separately by hand, especially the finer garments.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Keep the veil as evidence and question the maid",
                    consequence: """
                            The maid says she saw a woman in dark mourning clothes come from the direction of the west corridor after the alarm was raised.
                            
                            She cannot swear it was Edith. The hallway was dim, and everyone in Grey House seems to own black cloth. But she remembers the woman adjusting one sleeve as if hiding a tear.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 8
                ),
                StoryChoice(
                    id: 1,
                    title: "Take the veil to Edith immediately",
                    consequence: """
                            Edith looks at it for only a second before saying many women in the house own black veils.
                            
                            Her composure barely changes, but she quickly asks whether Harry has been questioned. The question is reasonable. Its timing is less so.
                            """,
                    effects: StoryEffects(clues: 1, delay: 1),
                    nextSceneID: 8
                )
            ]
        ),
        
        StoryScene(
            id: 8,
            name: "Doctor's Examination",
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
                            Dr. Engelson says the statue is almost certainly the weapon, but not where it was found. One side is too clean, the other too heavily bloodied.
                            
                            Lord Grey was struck near the desk. Afterward, the murderer moved the statue toward the fireplace to make the room look more chaotic.
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
                    
                    The unfinished letter says Lord Grey intended to alter his will, end a widow's allowance paid from the family accounts, and expose debts that had been quietly settled in the name of Grey House.
                    
                    The final amendment itself is gone. Whoever burned it did not merely fear inheritance changing hands. They feared being named.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Examine the envelope and broken seal",
                    consequence: """
                            You find a broken piece of red sealing wax on the desk and remember the matching wax near the fireplace.
                            
                            The envelope was opened before Lord Grey died. Someone had read enough to know what the amendment would expose, then destroyed the part that mattered most. Whoever killed him was not acting blindly. They knew exactly what they were trying to erase.
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
                    
                    You have enough reason to continue, but the household is exhausted, and several witnesses have begun contradicting themselves.
                    
                    Edith quietly suggests postponing the investigation until morning. Harry is drunk with rage, Annie can barely speak, and the servants have begun repeating one another's fears as facts. Edith insists that another hour of panic will only produce a false confession or a false accusation.
                    
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
                            You accept Edith's suggestion and allow the household to retire. Ivan claims he is too worried to sleep, so he offers to watch the door.
                            
                            By morning, you find him slumped beside it, sick and ashamed. Edith had brought him chamomile tea, he says, to help him stay awake. The watch failed. The veil, the sealing wax, and Edith herself are gone.
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
                    
                    At the end of the corridor, an old door leads to the service stairs. From there, a person could reach the servants' corridor behind the study without crossing the main hall.
                    
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
                            You find old guest books, cracked mirrors, and theatrical costumes from a family masquerade held years ago.
                            
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
                    You talk to the family cook again. Mrs. Madison stiffly says that she had served the Grey family for thirty years and knows better than to believe every respectable face.
                    
                    She tells you Lord Grey had summoned Edith to the study that morning. He had discovered irregularities in the family accounts and wanted answers before the hotel opened.
                    
                    Edith later warned the servants not to repeat anything they had heard. She said scandal would ruin Grey House before its first guests arrived. Mrs. Madison claims it sounded like concern for the household, but she has wondered since whether it was concern for herself.
                    
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
                            
                            He argued with his father, yes, and he did help break open the study door afterward. That may explain the stain on his cuff and the scratch on his hand. But Mrs. Madison says Harry is loudest when he is safest, and quietest when truly afraid.
                            
                            This helps weaken the case against Harry, but it does not directly trap Edith.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 13
                )
            ]
        ),
        
        StoryScene(
            id: 13,
            name: "Edith's Room",
            description: """
                    You search Edith's room with Mrs. Madison as witness. The room is immaculate. Too immaculate.
                    
                    Her writing desk has been cleared, her fireplace recently swept, and you can see the corner of a travel case peeking from beneath the bed.
                    
                    Inside the case, you find a pair of gloves, money, and a timetable for the evening mail coach that stops near the old carriage road.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Search the fireplace and writing desk",
                    consequence: """
                            In the ashes, you find a half-burned note from a creditor threatening to expose Edith's debt.
                            
                            Beneath a stack of letters in the drawer, you also find a thin bent wire, blackened near one end as if it had been hastily passed through ash.
                            
                            It is exactly the sort of tool that could have turned the study key from the outside.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 14
                ),
                StoryChoice(
                    id: 1,
                    title: "Search the travel case and wardrobe",
                    consequence: """
                            You find a mourning dress folded beneath ordinary travelling clothes. One sleeve has been carefully mended, the stitches fresh and uneven.
                            
                            You cannot prove from the dress alone that it was worn in the study, but the repair sits exactly where the maid remembered seeing a woman hide her sleeve. Beside it lies money, a small travelling case, and a timetable for the evening mail coach.
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
                    title: "Accuse the widow",
                    consequence: """
                            You name Edith Grey and begin laying out the evidence. For the first time, the room itself seems to hold its breath.
                            
                            At the mention of the torn veil, the west corridor, and the false locked room, Edith's eyes move toward the servants' passage.
                            """,
                    effects: StoryEffects(),
                    nextSceneID: nil
                ),
                StoryChoice(
                    id: 1,
                    title: "Accuse the heir",
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
                    You accuse Edith Grey in the great hall and lay out the evidence piece by piece. The torn veil. The burned will. The staged lock. The west-wing passage. The travel case hidden beneath her bed.
                    
                    Edith tries to remain dignified, but the evidence leaves her less room with every word. The torn veil places the disguise in the house. The broken seal places her before the burned will. The bent wire destroys the miracle of the locked room. She reaches for the servants' passage, only to find you already watching it.
                    
                    The constable takes Edith away just after six. The rain has stopped, but the hall still smells of damp wool and smoke.
                    
                    Later, the case seems simpler than it felt inside Grey House. Harry had made himself easy to suspect. Edith had made herself easy to overlook. The truth was colder: Edith Grey wanted to preserve the position Charlie's death had left her, used family money recklessly and killed when threatened to be exposed.
                    
                    The truth is recorded. Grey House will never fully recover, but justice arrives before the killer can escape.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 101,
            name: "The Truth Too Late",
            description: """
                    You accuse Edith Grey, and the evidence is strong enough to expose her. The household falls silent as each detail connects: the veil, the will, and the false locked room.
                    
                    But you spent too long chasing ghost stories, family grudges, and useless gossip. Each delay gave Edith another moment to prepare her escape.
                    
                    Before you can finish, a shout from the servants' corridor breaks the room into panic. Edith uses the confusion to slip away. By the time you reach her room, the travel case is gone. By the time you reach the carriage road, only wheel tracks remain in the mud.
                    
                    You know the truth. You can prove the truth. But Edith Grey is gone.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 102,
            name: "The Wrong Shadow",
            description: """
                    The investigation collapses beneath suspicion and superstition. Perhaps Harry looked too guilty. Perhaps the Mourning Lady seemed too real. Perhaps the evidence was there, but you left it scattered in dark rooms and frightened conversations.
                    
                    By next morning, Edith Grey is gone. The burned papers are destroyed completely. The torn veil disappears. The servants change their stories. Harry becomes the family scandal, Annie retreats into silence, and Grey House gains one more ghost story.
                    
                    The official report circles Harry's name without ever proving the case. Even years later, drunk villagers at the nearby tavern still argue over who killed Lord Grey and why.
                    
                    Only one truth remains certain: whatever killed Lord Grey was human, ordinary, and real enough to touch.
                    """,
            choices: []
        )
    ]
}
