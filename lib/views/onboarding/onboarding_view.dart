import 'package:bardly_mobile_app/home/home_view.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeView()), (route) => false);
      },
      pages: [
        WhatsNewPage(
          title: const Text(
            "What's New Template",
            style: TextStyle(color: Color.fromARGB(255, 8, 217, 168)),
          ),
          features: const [
            WhatsNewFeature(
              title: Text(
                'Showcase your App Features',
                style: TextStyle(color: Colors.white),
              ),
              description: Text(
                'Clean and minimalistic iOS styled template for showing app features e.g. in a new update.',
                style: TextStyle(color: Colors.grey),
              ),
              icon: Icon(
                CupertinoIcons.star,
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
            WhatsNewFeature(
              title: Text(
                "Styled Icons and Buttons",
                style: TextStyle(color: Colors.white),
              ),
              description: Text(
                "To create consistent look, icons and buttons are styled to match your CupertinoTheme's primaryColor. ",
                style: TextStyle(color: Colors.grey),
              ),
              icon: Icon(
                CupertinoIcons.paintbrush,
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
            WhatsNewFeature(
              title: Text(
                'Style Flexiblity',
                style: TextStyle(color: Colors.white),
              ),
              description: Text(
                "What's New Template can be styled to match new and old iOS versions of onboarding or your own preferences.",
                style: TextStyle(color: Colors.grey),
              ),
              icon: Icon(
                CupertinoIcons.gear,
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
            title: Text(
              'Support For Multiple Pages',
              style: TextStyle(
                color: Color.fromARGB(255, 8, 217, 168),
              ),
            ),
            body: Icon(
              CupertinoIcons.location,
              size: 200,
              color: Colors.white,
            )),
        const CupertinoOnboardingPage(
          title: Text(
            'Great Look in Light and Dark Mode',
            style: TextStyle(
              color: Color.fromARGB(255, 8, 217, 168),
            ),
          ),
          body: Icon(
            CupertinoIcons.command,
            size: 200,
            color: Colors.white,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text(
            'Beautiful and Consistent Appearance',
            style: TextStyle(
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
