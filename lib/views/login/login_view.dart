import 'package:bardly_mobile_app/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    // final InAppReview inAppReview = InAppReview.instance;

    Future.delayed(const Duration(seconds: 3), () async {
      // if (await inAppReview.isAvailable()) {
      //   inAppReview.requestReview();
      //   inAppReview.openStoreListing(appStoreId: '555115173');
      // }
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CalendarHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2d40),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 60,
                  child: GradientText(
                    'Bardly',
                    style: TextStyle(fontSize: 40),
                    gradient: LinearGradient(colors: [
                      Color(0xff00ffc3),
                      Color(0xff04f4bc),
                    ]),
                  ),
                ),
                Container(
                  child: const Text(
                    'with AI',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
            const CircularProgressIndicator(
              color: Color(0xff1e2d40),
              backgroundColor: Color(0xff04f4bc),
            )
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
