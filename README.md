# BaybayinGo!: Baybayin Educational Application
BaybayinGo! is an educational application that aims to make studying Baybayin more convenient by providing a digital education platform to learn about the definition, history, and cultural significance of the Baybayin script, one of the greatest national treasures of the Filipino language. One of the app’s most important features is that it provides a fun and interactive way of learning how to read and write in the Baybayin script through lectures, examples, flashcards, and quizzes.

# Tools
- Visual Studio Code
- Dart
- Flutter SDK
# Framework & Assets
- BaybayinSimpleTAWBID.ttf
- BaybayinGo! Logo
- Material Design Widgets

# App Features
# A. Home Page
The Home Page serves as the main entry screen of the app. It features a clean layout with the app title rendered using a custom Baybayin font, imported through the Flutter pubspec.yaml and applied via the fontFamily property. It features the app logo which is the character “Go”  in Baybayin. Three main navigation buttons are centered on the page, each leading to one of the core features of the app:
  1. What is Baybayin Page - contains definition, history, and cultural information.
  2. Learn Baybayin - contains structured lessons about writing & reading rules.
  3. Baybayin Quiz - contains flashcards and quizzes to practice Baybayin writing and reading skills.
# B. What is Baybayin Page
The What is Baybayin page is designed as an informational screen that presents the definition, history, and cultural background of the Baybayin script. The layout uses a scrollable column to ensure text is readable on both small and large screens without overflow. Headings are bolded for hierarchy, and body text uses clean sans-serif styling for readability. Visual separation is achieved through padding, spacing, and section dividers. Overall, its HCI design focuses on clarity, readability, and simple navigation, making the historical content easy to explore.
# C. Learn Baybayin Page
This page provides structured lessons on reading and writing Baybayin.
- Baybayin Chart: Implemented as a grid layout where each character is placed inside a styled container using the custom Baybayin font.
- Lesson Navigation: Buttons or cards lead to lessons on consonant-vowel rules, kudlit usage, pamudpod, and other writing rules. Flutter’s InkWell and ElevatedButton widgets provide clear visual feedback and intuitive navigation.
The layout emphasizes spacing, visual grouping, and readable typography to make learning interactive and user-friendly.
# D. Baybayin Quiz Page
The quiz module includes memorization flashcards and reading/writing quizzes:
- Memorization Flashcards:
  - Displays one Baybayin syllable at a time with flip functionality to show its Latin-alphabet equivalent.
  - Implemented using a list of character–meaning pairs and PageView or button navigation.
  - Card styling uses Containers with padding, rounded corners, and shadows for readability.
- Reading Quiz:
  - Presents a Baybayin word/phrase; users select the correct Latin-alphabet transliteration.
  - Five random questions are generated each session using a shuffled list.
- Writing Quiz:
  - Users are given a Latin-alphabet word/phrase and must type the Baybayin equivalent using a custom in-app keyboard.
  - The TextField renders typed characters in Baybayin using the custom font.
  - Each key on the keyboard inserts a Baybayin symbol encoded with your symbol system (e.g., N+, +, E, O).
  - Input is validated against stored encoded answers; correct submissions increment the score.
  - A SnackBar provides immediate feedback, and incorrect attempts are stored for retry.
# E. Originality and Acknowledgements
All code, UI layout, and app assets used in this project were developed by Paul Aldrich Pimentel originally for this ICS26011 final project without using templates or pre-made applications. I acknowledge the following source materials freely provided by the NGO, Baybayin Buhayin:
- John NL Leyson — Co-Founder of Baybayin Buhayin; creator of the custom Baybayin font used in the app.
- Jose Jaime Enage — Founding Chairman of Baybayin Buhayin; creator of the “Baybayin Workshop” PowerPoint presentation, which provided background information and lecture material that helped shape the educational content of the app.
All third-party materials are used strictly for educational purposes. This application, BaybayinGo!, promotes awareness of Baybayin as part of Filipino cultural heritage and teaches the script in alignment with Christian values of knowledge and stewardship.
