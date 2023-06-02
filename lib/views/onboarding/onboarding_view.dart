import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';

class CalendarHome extends StatelessWidget {
  const CalendarHome({Key? key}) : super(key: key);

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
      onPressedOnLastPage: () => Navigator.pop(context),
      pages: [
        WhatsNewPage(
          title: const Text("What's New Template"),
          features: const [
            WhatsNewFeature(
              title: Text('Showcase your App Features'),
              description: Text('Clean and minimalistic iOS styled template for showing app features e.g. in a new update.'),
              icon: Icon(CupertinoIcons.star),
            ),
            WhatsNewFeature(
              title: Text("Styled Icons and Buttons"),
              description: Text("To create consistent look, icons and buttons are styled to match your CupertinoTheme's primaryColor. "),
              icon: Icon(CupertinoIcons.paintbrush),
            ),
            WhatsNewFeature(
              title: Text('Style Flexiblity'),
              description: Text("What's New Template can be styled to match new and old iOS versions of onboarding or your own preferences."),
              icon: Icon(CupertinoIcons.gear),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
          title: Text('Support For Multiple Pages'),
          body: Icon(
            CupertinoIcons.square_stack_3d_down_right,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Great Look in Light and Dark Mode'),
          body: Icon(
            CupertinoIcons.sun_max,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Beautiful and Consistent Appearance'),
          body: Icon(
            CupertinoIcons.check_mark_circled,
            size: 200,
          ),
        ),
      ],
    );
  }
}
