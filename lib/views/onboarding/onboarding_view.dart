import 'package:bardly_mobile_app/utils/uilts.dart';
import 'package:bardly_mobile_app/views/home/home_view.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnboardingOverview();
  }
}

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      bottomButtonColor: const Color.fromARGB(255, 8, 217, 168),
      backgroundColor: const Color(0xff1e2d40),
      onPressedOnLastPage: () {
        StorageUtil.setLandingCompleted(true);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeView()), (route) => false);
      },
      pages: [
        WhatsNewPage(
          title: const Text(
            "Welcome to Assistly",
            style: TextStyle(fontFamily: 'Ubuntu', color: Color.fromARGB(255, 8, 217, 168)),
          ),
          features: const [
            WhatsNewFeature(
              title: Text(
                'Assistly is connected to Internet!',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white),
              ),
              description: Text(
                'Assistly can search internet for serve true information to you. Also Assistly can show newest information from Internet.',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
              icon: Icon(
                CupertinoIcons.wifi,
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
            // WhatsNewFeature(
            //   title: Text(
            //     "Assistly powered by Google💙",
            //     style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white),
            //   ),
            //   description: Text(
            //     "Assistly is a new application powered by Google that uses Bard for AI processes. Bard is a large language model that can generate text, translate languages, write different kinds of creative content, and answer your questions in an informative way.",
            //     style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
            //   ),
            //   icon: Icon(
            //     Symbols.electric_bolt_rounded,
            //     color: Color.fromARGB(255, 8, 217, 168),
            //   ),
            // ),
            WhatsNewFeature(
              title: Text(
                'Keeping Updated ',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white),
              ),
              description: Text(
                "Assistly can always provide you with the most accurate and up-to-date information. If you ask Assistly about a current event, It will be able to tell you the latest news about it. Assistly can also keep you updated on your favorite topics, such as sports, movies, or music.",
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
              icon: Icon(
                Symbols.update,
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
            title: Text(
              'You can ask questions about current topics',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
            body: Icon(
              CupertinoIcons.calendar_badge_minus,
              size: 200,
              color: Colors.white,
            )),
        const CupertinoOnboardingPage(
          title: Text(
            'Perform  analysis, translation, and more with URL',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Color.fromARGB(255, 8, 217, 168),
            ),
          ),
          body: Icon(
            Symbols.webhook,
            size: 200,
            color: Colors.white,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text(
            'Now you are going to meet with Assistly!',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Color.fromARGB(255, 8, 217, 168),
            ),
          ),
          body: Icon(
            CupertinoIcons.check_mark_circled,
            size: 200,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
