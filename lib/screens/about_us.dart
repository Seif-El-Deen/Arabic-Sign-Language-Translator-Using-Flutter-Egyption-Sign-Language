import 'package:flutter/material.dart';
import 'package:gp_project/shared/shared_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Image.asset(
                "assets/images/app_logo.png",
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                " أسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عن اسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عناسمعني هو تطبيق عن ",
                style: TextStyle(color: Colors.white),
                maxLines: 6,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "فريق أسمعنى",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [memberName(), memberName()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [memberName(), memberName()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [memberName(), memberName()],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
