import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineTranslationScreen extends StatelessWidget {
  const OnlineTranslationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
      return SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      final p = Provider.of<MyProvider>(context, listen: false);
                      p.changePageNumber(pageNum: 1);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    )),
                Image.asset(
                  "assets/images/app_logo.png",
                  width: 100,
                  height: 100,
                )
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: WebView(
                initialUrl: 'https://21ea-156-195-240-173.ngrok-free.app/',
                javascriptMode: JavascriptMode.unrestricted,
                allowsInlineMediaPlayback: true,
                zoomEnabled: false,
              ),
            ),
            const Divider(
              thickness: 4,
              height: 4,
              color: Colors.lightGreenAccent,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ));
    });
  }
}
