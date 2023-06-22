import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/shared_widgets.dart';
import 'package:provider/provider.dart';

class TranslatingHomeScreen extends StatelessWidget {
  const TranslatingHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
      return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0E092A),
                Color(0xFF261D5C),
                Color(0xFF0E092A),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset(
                "assets/images/app_logo.png",
                height: 200,
                width: 250,
              )),
              const SizedBox(height: 50),
              homeButton(
                  text: "الاتصال عبر الانترنت",
                  onTap: () {
                    final p = Provider.of<MyProvider>(context, listen: false);
                    p.changePageNumber(pageNum: 7);
                  }),
              const SizedBox(height: 30),
              homeButton(text: "الاتصال بدون الانترنت"),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
