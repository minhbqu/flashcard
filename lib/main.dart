import 'package:flashcard/view/flashcard/flashcard_screen.dart';
import 'package:flashcard/viewmodel/helper/color_helper.dart';
import 'package:flashcard/viewmodel/helper/preference_helper.dart';
import 'package:flashcard/viewmodel/helper/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/theory/theory_word_json_object.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PreferenceHelper.getInstance(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            preferenceHelper = snapshot.data;
            return MaterialApp(
              title: 'Flashcard App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: FlashcardScreen(wordList: _defaultWordList),
            );
          }
          return Container(color: ColorHelper.colorPrimary);
        });
  }

  static final List<TheoryWord> _defaultWordList = [
    TheoryWord('1', 'apple', 'A fruit', 'apple.mp3', []),
    TheoryWord('2', 'banana', 'Another fruit', 'banana.mp3', []),
    // Add more words as needed
  ];
}

