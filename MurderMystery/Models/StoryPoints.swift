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
            name: "Arrival at Crawlford House",
            description: """
                    It is 13:07 when you arrive at Crawlford House. You are late but your train was delayed due to severe weather conditions. The rain is so thick that whoever looking after the mansion had to lit the lamps.
                    
                    You know from papers that the family was struggling financially for a while and even had to convert part of the mansion into a private hotel. The conversion was recently completed and the hotel was about to open its doors to its first guests. However, the grand opening might have to be delayed as you were called to investigate a murder.
                    
                    You are grateful when a nervous bellboy opens the door for you. As you watch water endlessly dripping from your coat, he tells you Lord Andrew Crawlford was found dead in his study less than two hours ago. The family is gathered inside, but nobody is allowed to leave until you have spoken to them.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Talk to the bellboy, Ivan",
                    consequence: """
                            Ivan says Lord Crawlford was still alive shortly after breakfast and had ordered that no one disturb him. According to him, Lord Crawlford seemed unusually worried.
                            
                            Ivan also says he saw a woman in a dark veil near the west corridor before the body was found, he suspects it could have been the Ashen Bride but doesn't offer any explanation, as he is interrupted when Eugene Crawlford enters the hall and asks you to follow her.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 1
                ),
                StoryChoice(
                    id: 1,
                    title: "Look around the entrance for clues",
                    consequence: """
                            You notice muddy footprints near the door, but they clearly belong to several people. Now, thanks to you, there are even more muddy footprints.
                            
                            Before you can investigate further, Eugene Crawlford approaches and asks you to follow her.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 1
                )
            ]
        ),
        
        StoryScene(
            id: 1,
            name: "Eugene Crawlford's Welcome",
            description: """
                    Eugene Crawlford is a woman in her thirties. Her long dark purple dress is spotless, but her make up is rough and somewhat wonky, she was probably crying not so long ago. This is also probably why she has to stop talking every few minutes. Her voice sounds strained from either screaming or talking but is empty of emotion.
                    
                    She says Lord Andrew Crawlford had his flaws. He was strict, controlling, and often argued with his children, yet his death has shattered the entire household. Since the death of Charlie, Lord Crawlford's youngest son and Eugene's husband, Crawlford House has been the only home left to her.
                    
                    She says she spent much of the late morning with Annie Crawlford, who had been frightened by the storm and by talk of the Ashen Bride. Eugene briefly looks at the study door. When she turns back, you notice that her fingers have tightened around her sleeve.
                    
                    Before leading you onward, Eugene quietly asks a maid to bring tea for Annie and the servants. "Give them tea before you question them," she says. "Everyone was really affected, it will help them calm down."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask Eugene directly about Lord Crawlford's enemies",
                    consequence: """
                            Eugene does not need long to name suspects. Harry had been begging for money, Annie was terrified of being cut out of the will, and the servants had heard enough threats of dismissal to fear the dead man even before he was dead.
                            
                            She avoids speaking about herself until you press her. Then she says Lord Crawlford offered her home after Charlie died, and that sort of debt is difficult to speak of plainly.
                            
                            She gives the answer too smoothly, then looks annoyed with herself for doing so.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 2
                ),
                StoryChoice(
                    id: 1,
                    title: "Remain silent and let Eugene speak first",
                    consequence: """
                            Eugene fills the silence by explaining the family history. She speaks of old betrayals, disputes over the future hotel, and rumours that the Crawlford House is cursed by the Ashen Bride. She also mentions the death of her husband, Charlie, Andrew's youngest son. Since Charlie died, Eugene has remained at Crawlford House as a widow dependent on Lord Crawlford's allowance.
                            
                            She says this dependence strained every relationship in the family. She seems relieved that you do not interrupt her.
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
                    Lord Andrew Crawlford's body lies beside his writing desk. His head is wounded, and one hand is clenched around a torn scrap of black fabric. A heavy bronze statue has fallen near the fireplace. At first glance, it seems to be the murder weapon.
                    
                    A fire burns low in the hearth, and several papers have been reduced to ash.
                    
                    At first glance, the room makes no sense. The windows are shut from the inside, the key is still in the lock, and the servants insist nobody came down the corridor.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Examine the body closely",
                    consequence: """
                            You find bruising on Lord Crawlford's wrist, as if someone grabbed him during a struggle. The wound on his head is severe, the murderer really wanted to make sure that Lord Crawlford doesn't come out of it alive.
                            
                            You also notice that the blood pattern on the floor suggests he was struck near the desk, not by the fireplace where the statue lies, so the statue was moved.
                            
                            You hum to yourself thinking about reasons one could possibly have to complicate an already complicated investigation.
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
                    Mrs. Madison, the family cook, explains that Lord Crawlford's study door was locked when Eugene called for help. Harry forced it open. The window was also locked.
                    
                    That is why some servants have started whispering that no living person could have killed him.
                    
                    The old key is still in the lock, on the inside of the door. The door is warped enough to leave a narrow gap above the floorboards. Beneath it, the dust shows a few thin scratches, almost too neat to be accidental.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Inspect the lock and key",
                    consequence: """
                            The key is scratched in a strange place, near the ring rather than the teeth. On the floor below the door, the dust has been dragged into thin lines that point straight toward the keyhole. The gap is big enough, and from experience you understand that a wire with a hook could have caught the ring and turned it, slowly, from the corridor. It would only require patience and something narrow enough to bend.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 4
                ),
                StoryChoice(
                    id: 1,
                    title: "Indulge Mrs. Madison's ghost rumours",
                    consequence: """
                            Mrs. Madison tells you the Ashen Bride was once a bride, an heir to the Crawlford family. Her beloved left to fight in a war, and she waited for him patiently in the west tower. However, upon his return, he was killed by traitors who robbed the mansion and burned it to the ground, including the tower together with the bride. 
                            
                            The mansion was since rebuilt, but the Ashen Bride now appears shortly before the tragedy to either warn the inhabitants or take their lives to avenge her beloved.
                            
                            The story makes you understand why everyone is so terrified, but gives you little solid evidence.
                            """,
                    effects: StoryEffects(delay: 1, wrongSuspicion: 1),
                    nextSceneID: 4
                )
            ]
        ),
        
        StoryScene(
            id: 4,
            name: "Harry Crawlford",
            description: """
                    You find Harry Crawlford in the library, drinking whisky with shaking hands. He does not pretend to mourn, he seems... relieved?
                    
                    He says his father was cruel, controlling, and enjoyed humiliating his children. Harry admits they argued that morning over money, because he found out he was getting a smaller allowance than other family members.
                    
                    There is a dark stain on one of his cuffs, and a shallow scratch across the back of his hand. When he notices you looking, he folds his arm across both too quickly.
                    
                    "He was going to reduce my allowance again," Harry mutters bitterly. "Said I was a disgrace to the family, especially after Charlie died and left this place full of widows and debts." He looks toward the study door, then away. "I hated him. But now I only hate myself for wishing him dead."
                    
                    He giggles drunkenly.
                    
                    "But you are going to blame me anyway, aren't you?"
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Question Harry about the argument",
                    consequence: """
                            Harry says Lord Crawlford planned to change his will that evening. The solicitor was expected after the storm passed.
                            
                            When you ask about the stain and the scratch, Harry says both came from helping force open the study door and kneeling near the body. He sounds ashamed rather than frightened, but his explanation arrives a little too quickly.
                            
                            He also says someone visited Lord Crawlford shortly before the argument. Harry heard a woman's voice, but not clearly enough to name it. In this house, he says, everyone whispers when money is mentioned.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 5
                ),
                StoryChoice(
                    id: 1,
                    title: "Accuse Harry of killing his father for the inheritance",
                    consequence: """
                            Harry becomes furious. He refuses to answer more questions and calls you a fool chasing the obvious suspect. He attempts to leave the room, bumps into the library door and warns everyone that you should not be trusted.
                            
                            You gain no proof, and everyone now has the impression that they should keep their mouths shut if they don't want to be blamed.
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
                    Annie Crawlford, Lord Crawlford's daughter, is found in the music room, staring at the piano without playing. She says she heard raised voices in the study before the murder, but she cannot say whose voices they were.
                    
                    She keeps glancing toward the dark hallway that leads to the west wing.
                    
                    She whispers that the Ashen Bride was seen last night.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Calm Annie and ask what she really heard",
                    consequence: """
                            Annie admits she heard Lord Crawlford say, "You will not bleed this family any longer."
                            
                            Then she heard a woman answer. Annie thought it sounded familiar, then doubted herself at once. The storm was loud and she was too scared to listen attentively.
                            
                            During the confusion after the alarm was raised, a calm voice told Annie not to repeat uncertain things in a house already half-mad with fear. Annie cannot remember the exact words now, only that obedience felt safer than doubt.
                            
                            Annie looks ashamed when she admits this. "I think I wanted to convince myself it was a ghost," her voice falters. "Because I was scared it wasn't."
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 6
                ),
                StoryChoice(
                    id: 1,
                    title: "Focus on the Ashen Bride",
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
                    
                    You find Ivan there, arguing quietly with a maid. When he sees you, he immediately shuts his mouth, pretending badly that nothing happened.
                    
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
                            You find several old theatrical props in a storage cupboard, including masks, cloaks, and fake mourning veils. They are in good enough condition to be worn, but nothing here points at a specific person.
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
                    The laundry room is hot, damp, and full of steam. Behind the boiler, you find a torn black veil. Its edge matches the scrap clenched in Lord Crawlford's hand.
                    
                    A maid tells you some of the household’s mourning clothes are washed separately by hand, especially the finer garments.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Keep the veil as evidence and question the maid",
                    consequence: """
                            The maid says she saw a woman in dark mourning clothes come from the direction of the west corridor after the alarm was raised.
                            
                            The hallway was dim, and in a house that has been mourning someone every few years, black cloth is not evidence. It is practically furniture. So she cannot tell who it was for sure, but she remembers the woman adjusting one sleeve as if hiding a tear.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 8
                ),
                StoryChoice(
                    id: 1,
                    title: "Take the veil to Eugene immediately",
                    consequence: """
                            Eugene looks at it for only a second before saying many women in the house own black veils.
                            
                            Eugene did not look frightened and didn't seem to believe in ghost stories, but her attention kept jumping to other things. Even while speaking to you, she noticed a crooked spoon on the tea tray and straightened it with two fingers.
                            
                            She then quickly asks whether Harry has been questioned. The question is reasonable. Its timing is less so.
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
                    
                    He confirms Lord Crawlford died from a blow to the head, he also notices a shallow cut on Lord Crawlford's palm and traces of ash under his fingernails.
                    
                    "He struggled with someone before he died. It seems the struggle didn't last long though."
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask whether the bronze statue was truly the weapon",
                    consequence: """
                            Dr. Engelson says the statue is almost certainly the weapon, but its location doesn't make sense. One side is too clean, the other too heavily bloodied.
                            
                            Lord Crawlford was struck near the desk. Afterward, the murderer moved the statue toward the fireplace to make the room look more chaotic.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 9
                ),
                StoryChoice(
                    id: 1,
                    title: "Ask whether Lord Crawlford could have fallen by accident",
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
                    You return to the study and search Lord Crawlford's desk more carefully. Inside a hidden drawer, you find an envelope addressed to his solicitor.
                    
                    The unfinished letter says Lord Crawlford intended to alter his will as he encountered unusual outgoings in the family account records. 
                    
                    The final amendment itself is gone. Whoever burned it clearly did not want to be named.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Examine the envelope and broken seal",
                    consequence: """
                            You find a broken piece of red sealing wax on the desk and remember the matching wax near the fireplace.
                            
                            The envelope was opened before Lord Crawlford died. Someone had read enough to know what the amendment would expose, then destroyed the part that mattered most. 
                            
                            This person was precise in their actions and left no room for clumsiness.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 10
                ),
                StoryChoice(
                    id: 1,
                    title: "Take the letter to Harry and ask if he knew about it",
                    consequence: """
                            Harry says he knew Eugene was in debt but did not know his father planned to expose her.
                            
                            He grows smug and says this proves Eugene is guilty, but he offers no new proof.
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
                    The weather forecast leaves much to be desired. The bridge road has started to flood, and the local constable warns that if the killer tries to flee tonight, there may be only one safe route left: the old carriage road through the woods.
                    
                    You have enough reason to continue, but everyone looks exhausted, and several witnesses have begun contradicting themselves.
                    
                    Eugene quietly suggests postponing the investigation until morning. Harry is drunk and cannot behave himself, Annie hiccups from constant crying, and the servants are too afraid of the Ashen Bride to think clearly. Eugene insists that another hour of panic will only produce a false confession or a false accusation.
                    
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
                            You accept Eugene's suggestion and allow the household to retire. Ivan claims he is too worried to sleep, so he offers to watch the door.
                            
                            By morning, you find him slumped beside it, sick and ashamed. Eugene had brought him chamomile tea, he says, to help him stay awake. The watch failed. The veil, the sealing wax, and Eugene herself are gone.
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
                    The west wing is rarely used due to its connection to the Ashen Bride. The family mostly uses it for storage and to accommodate the servants. The latter, seemingly, don't bother to keep this place clean. The floor is dusty, except for a narrow path of fresh footprints. The amount of dust makes you sneeze multiple times as you explore the location.
                    
                    At the end of the corridor, an old door leads to the service stairs. From there, a person could reach the servants' corridor behind the study without crossing the main hall.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Follow the footprints to the service stairs",
                    consequence: """
                            The footprints show someone moved quickly from the study area to the west wing after the murder.
                            
                            The footprints stop near the service stairs. You look back toward the main hall and realise no one there would have seen a person leave this way.
                            """,
                    effects: StoryEffects(clues: 1),
                    nextSceneID: 12
                ),
                StoryChoice(
                    id: 1,
                    title: "Search the old guest rooms for the ghost",
                    consequence: """
                            You find old guest books, cracked mirrors, and theatrical costumes from a family masquerade held years ago.
                            
                            The west corridor smells of century old dust. One floorboard clicks every time you shift your weight. The atmosphere is frightening, but the search costs time and reveals little beyond confirming the ghost story can be faked.
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
                    You talk to the family cook again. Mrs. Madison stiffly says that she had served the Crawlford family for thirty years and knows better than to believe every respectable face.
                    
                    She tells you Lord Crawlford had summoned Eugene to the study that morning. He had discovered irregularities in the family accounts and wanted answers before the hotel opened.
                    
                    Eugene later warned the servants not to repeat anything they had heard. She said scandal would ruin Crawlford House before its first guests arrived. Mrs. Madison claims it sounded like concern for the household, but she has wondered since whether it was concern for herself.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Ask Mrs. Madison what Eugene was wearing that morning",
                    consequence: """
                            Mrs. Madison says Eugene wore a black veil at breakfast, claiming a headache from the storm light.
                            
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
                            
                            This helps weaken the case against Harry, but it does not directly trap Eugene.
                            """,
                    effects: StoryEffects(delay: 1),
                    nextSceneID: 13
                )
            ]
        ),
        
        StoryScene(
            id: 13,
            name: "Eugene's Room",
            description: """
                    You search Eugene's room with Mrs. Madison as witness. The room is tidied pedantically and barely has any unique characteristics suggesting that someone is indeed occupying it. The hairbrush is clean, the ash tray is empty, and even the chair has been pushed back to exactly the right angle.
                    
                    The writing desk has been cleared, the fireplace recently swept, and you can see the corner of a travel case peeking from beneath the bed.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Search the fireplace and writing desk",
                    consequence: """
                            In the ashes, you find a half-burned note from a creditor threatening to expose Eugene's debt.
                            
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
                            
                            You cannot prove from the dress alone that it was worn in the study, but the repair sits exactly where the maid remembered seeing a woman hide her sleeve. Beside it lies money, a small travelling case, and a timetable for the evening mail coach that stops near the old carriage road.
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
                    You invite everyone to gather in the dining room. As you enter the room, you can see Eugene standing near the staircase, her face seems even paler than usual. Harry demands that you arrest her immediately. Annie cries silently. Ivan watches the doors.
                    
                    You fear that you don't have any more time, as you can see and hear that the weather is improving. You know now more than ever than an escape is possible.
                    
                    You decide to:
                    """,
            choices: [
                StoryChoice(
                    id: 0,
                    title: "Accuse the widow",
                    consequence: """
                            You name Eugene Crawlford and begin laying out the evidence. No one interrupts you. Harry is finally silent. Only Annie keeps crying in her handkerchief. 
                            
                            At the mention of the torn veil, the west corridor, and the false locked room, Eugene's eyes move toward the servants' passage.
                            """,
                    effects: StoryEffects(),
                    nextSceneID: nil
                ),
                StoryChoice(
                    id: 1,
                    title: "Accuse the heir",
                    consequence: """
                            The accusation makes Harry sober up. He drops his whisky glass and, of course, denies everything. Eugene uses the confusion to vanish through the servants' passage.
                            
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
                    You accuse Eugene Crawlford in the great hall and lay out the evidence piece by piece. How she disguised herself to appear as a ghost, how she locked the door using the wire. Once you get to the broken seal and burned will part of the story, you notice that she reaches for the servants' passage. Unfortunately for her, you are already watching it.
                    
                    Eugene refuses to talk and doesn't look at you as the constable takes her away. It happens just moments before 6, which conveniently allows you to catch the train to your next destination.
                    
                    Later, while on the train, you can't stop thinking that the case seems simpler than it felt inside Crawlford House. You couldn't find any ghosts in the mansion. Although Harry had a motive, he was still family and would probably have been treated differently if he stole money. Eugene, on the other hand, was no one to this family. She was Charlie's wife, but his death left her defenceless, as no one would protect or defend her if she were exposed, so she had to act fast.
                    
                    You write Eugene Crawlford’s name in the report before the ink bottle stops shaking on the train table. By the time the house disappears behind the rain, you are not thinking about ghosts anymore, as you fall asleep from exhaustion.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 101,
            name: "The Truth Too Late",
            description: """
                    You accuse Eugene Crawlford, and the evidence is strong enough to expose her: the veil, the will, and the false locked room all lead to her being the culprit.
                    
                    But you spent too long chasing ghost stories, family grudges, and useless gossip. Each delay gave Eugene another moment to prepare her escape.
                    
                    Before you can finish, a shout from the servants' corridor breaks the room into panic. Eugene uses the confusion to slip away. By the time you reach her room, the travel case is gone. You run towards the carriage road as fast as you can, but see only the wheel tracks in the mud.
                    
                    You know the truth and you can prove your accusations to the constable, but he has to leave empty-handed as by the time he arrives, Eugene Crawlford is long gone.
                    """,
            choices: []
        ),
        
        StoryScene(
            id: 102,
            name: "The Wrong Shadow",
            description: """
                    You fail to name the killer despite all your genuine attempts. Was it Harry who looked too guilty, was it the Ashen Bride who seemed too real? The evidence had not been hidden especially well, but you had other priorities.
                    
                    By next morning, Eugene Crawlford is gone. The burned papers are destroyed completely, the torn veil disappears. The servants change their stories, afraid to be framed, Harry drowns his part of family inheritance in alcohol, and Annie struggles to lead the family without guidance.
                    
                    The official report focuses on Harry but doesn't prove anything. Even years later, drunk villagers at the nearby tavern still argue over who killed Lord Crawlford and why. It makes the hotel especially popular among the ghost story fans who help it stay profitable.
                    
                    As a detective, you have tried your best but right now you can only move on.
                    """,
            choices: []
        )
    ]
}
