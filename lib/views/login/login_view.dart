import 'package:bardly_mobile_app/utils/uilts.dart';
import 'package:bardly_mobile_app/views/home/home_view.dart';
import 'package:bardly_mobile_app/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/bard/bard_bloc.dart';
import '../../bloc/bard/bard_event.dart';

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
      getLandingInfo();
      BardBloc().add(GetSystemVariablesEvent());
      // context.read<BardBloc>().add(GetSystemVariablesEvent());
    });
  }

  Future<void> getLandingInfo() async {
    if (await StorageUtil.getLandingCompleted()) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeView()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const OnboardingView()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2d40),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              'assets/logo.svg',
              semanticsLabel: 'Label',
              height: 50,
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 60,
                  child: GradientText(
                    'Bardly',
                    style: TextStyle(fontSize: 40, fontFamily: 'Ubuntu'),
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
                    style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Ubuntu'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              color: Color(0xff1e2d40),
              backgroundColor: Color(0xff04f4bc),
            ),
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
