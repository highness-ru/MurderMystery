# Murder Mystery

Murder Mystery is a text-based detective visual novel built for iOS using Swift and SwiftUI.

## About the Game

The player takes the role of a detective investigating a murder inside Grey House, an old mansion that was recently converted into a private hotel.

The head of the Grey family has been found dead under suspicious circumstances. The player must question suspects, examine clues, and find out who is responsible for the murder.

Every scene presents the player with two choices. Each choice can reveal evidence, waste time, or lead the investigation in the wrong direction. The goal is to identify the killer before it is too late.

## Features

- Branching text-based story
- Multiple-choice investigation system
- Consequences based on player decisions
- Clue, delay, and suspicion tracking
- Multiple endings
- Separate story and ending views
- Main menu, about screen, and credits screen
- Background images for menu and story screens
- Background music and an option to turn it off
- Designed for iOS using SwiftUI

## How to Play

- Start a new investigation from the main menu.
- Read each scene carefully.
- Choose one of the two available options.
- Some choices reveal important clues.
- Some choices waste time or increase suspicion toward the wrong person.
- Continue investigating until you reach the final accusation.
- Your ending depends on the choices you made during the investigation.

## Endings

The game includes three possible outcomes:

- The detective identifies and catches the culprit in time.
- The detective identifies the culprit, but takes too long and the killer escapes.
- The detective fails to identify the murderer.

## Technologies Used

- Swift
- SwiftUI
- Xcode
- iOS

## Project Structure

The game uses a simple story model built around scenes and choices.

Each story scene contains:

- Scene ID
- Scene name
- Scene description
- Two possible choices

Each choice contains:

- Choice title
- Consequence text
- Story effects
- Next scene ID

The story tracks player progress using values such as:

- Clues
- Delay
- Wrong suspicion

These values determine which ending the player receives.

## Assets

Art:

- Main Menu and Secondary Menu background art: Fylgjur (https://www.deviantart.com/cospigeon)

Music and sound effects:

- "Darkest Night", "Disintegrating", "Fading" by Myuu
- Licensed under CC BY NC 3.0
- Source: https://creativecommons.org/licenses/by-nc/3.0/

## Future Improvements

- Add sound effects for scenes
- Add character pictures and animations
- Add scene-specific background images
- Add save/load system
- Add more branching paths and additional endings
- Work on the overall plot to make it more interesting and less rushed
- Add voiceover

## Author

Created by highness-ru

GitHub: https://github.com/highness-ru
