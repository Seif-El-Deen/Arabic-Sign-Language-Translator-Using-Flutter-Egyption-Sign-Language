import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/screens/about_us.dart';
import 'package:gp_project/screens/home/learning_home_screen.dart';
import 'package:gp_project/screens/home/online_translation_screen.dart';
import 'package:gp_project/screens/home/translating_home_screen.dart';
import 'package:gp_project/screens/learning/numbers_learning_screen.dart';
import 'package:gp_project/screens/learning/sentences_learning_screen.dart';
import 'package:gp_project/screens/learning/words_learning_screen.dart';
import 'package:gp_project/screens/learning/letters_learning_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  int _currentIndex = 0;
  late PageController _pageController = PageController();

  Widget returnBody() {
    switch (MyProvider.pageNumber) {
      case 0:
        return LearningHomeScreen();
      case 1:
        return TranslatingHomeScreen();
      case 2:
        return AboutUsScreen();
      case 3:
        return NumbersLearningScreen();
      case 4:
        return LettersLearningScreen();
      case 5:
        return WordsLearningScreen();
      case 6:
        return SentencesLearningScreen();
      case 7:
        return OnlineTranslationScreen();
    }
    return LearningHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: Consumer<MyProvider>(
        builder: (context, myModel, child) {
          return Scaffold(
            backgroundColor: const Color(0xff1E1E1E),
            body: returnBody(),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF2A2A2A),
                border: Border(
                  top: BorderSide(
                    width: 3.0,
                    color: Color(0xFFFE00F4),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 0);
                      },
                      icon: const Icon(
                        Icons.menu_book_outlined,
                        color: Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 1);
                      },
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 2);
                      },
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 36,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
