import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Future<void> _launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launch(url, forceSafariVC: false); // Launch the app if installed!

      if (!launched) {
        launch(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launch(url); // Launch web view if app is not installed!
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1e2d40),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              semanticsLabel: 'Label',
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 45,
              child: GradientText(
                'Bardly',
                style: TextStyle(fontFamily: 'Anton', fontSize: 30.0, color: Colors.white.withOpacity(0.7)),
                gradient: const LinearGradient(colors: [
                  Color(0xff00ffc3),
                  Color(0xff04f4bc),
                ]),
              ),
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  text: 'With',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(text: ' AI', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.7))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff1e2d40),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 12),
              child: Text(
                'SOCIAL',
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 54, 83, 120).withOpacity(0.5),
                ),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  top: 12,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _launchSocialMediaAppIfInstalled(
                          url: 'https://www.instagram.com/creatoriumapps/',
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/instagram.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Follow us on Instagram',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 0.3),
                    InkWell(
                      onTap: () {
                        _launchSocialMediaAppIfInstalled(
                          url: 'https://www.linkedin.com/company/creatorium-apps',
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/linkedin.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Follow us on LinkedIn',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 0.3),
                    InkWell(
                      onTap: () {
                        _launchSocialMediaAppIfInstalled(
                          url: 'https://twitter.com/CreatoriumApps',
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/twitter.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Follow us on Twitter',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 15, bottom: 12),
              child: Text(
                'Support Us',
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 54, 83, 120).withOpacity(0.5),
                ),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  top: 12,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _launchSocialMediaAppIfInstalled(
                          url: 'https://www.instagram.com/creatoriumapps/',
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/watch_ads.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Watch Ads',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 0.3),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse('https://www.buymeacoffee.com/creatorium'));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/coffee.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Buy me a coffee',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 12),
              child: Text(
                'ABOUT US',
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 54, 83, 120).withOpacity(0.5),
                ),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  top: 12,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _launchSocialMediaAppIfInstalled(
                          url: 'https://www.creatorium.org/docs/privacy_policy.html',
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/shield.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 0.3),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                                child: Image.asset(
                              'assets/stars.png',
                              height: 42,
                              width: 42,
                            )),
                          ),
                          Text(
                            'Rate us',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 0.3),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                              child: Image.asset(
                            'assets/share.png',
                            height: 30,
                            width: 42,
                          )),
                        ),
                        Text(
                          'Share with your friends',
                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/powered_google.png",
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
