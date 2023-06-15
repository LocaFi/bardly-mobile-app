import 'package:bardly_mobile_app/views/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

int _indexFirstList = 0;
int _indexSecondList = 0;
int _indexThirdList = 0;
int _indexFourList = 0;
int _indexFiveList = 0;
int _indexSixList = 0;
int _indexSevenList = 0;
int _indexEigthList = 0;
List<String> textBasedSkillsImages = [
  'assets/improve_img.png',
  'assets/summarize_png.png',
  'assets/paragraph_img.png',
  'assets/translate_img.png',
];
List<String> artSkillsImages = [
  'assets/lyrics_img.png',
  'assets/poem_img.png',
  'assets/story_img.png',
  'assets/short_movie_img.png',
];
List<String> businessSkillsImages = [
  'assets/company_name_img.png',
  'assets/company_slogan_img.png',
  'assets/job_post_img.png',
  'assets/company_bio_img.png',
];

List<String> socialSkillsImages = [
  'assets/tweet_img.png',
  'assets/linkedin_img.png',
  'assets/instagram_img.png',
  'assets/tiktok_img.png',
  'assets/viral_video_img.png',
];
List<String> emailSkillsImages = [
  'assets/tweet_img.png',
  'assets/linkedin_img.png',
  'assets/instagram_img.png',
  'assets/tiktok_img.png',
  'assets/viral_video_img.png',
];
List<String> codeSkillsImages = [
  'assets/write_code_img.png',
  'assets/explain_code_img.png',
];
List<String> foodSkillsImages = [
  'assets/recipe_img.png',
  'assets/diet_plan_iimg.png',
];
List<String> entertainmentSkillsImages = [
  'assets/joke_img.png',
  'assets/complete_sentences_img.png',
];
String artImages = "assets/art.png";
String textImages = "assets/book.png";
String businessImages = "assets/business.png";
String socialImages = "assets/social.png";
String mailImages = "assets/mail.png";
String codeImages = "assets/code.png";
String foodImages = "assets/recipe.png";
String entertainmentImages = "assets/enter.png";

class _ExplorePageState extends State<ExplorePage> {
  List<Widget> textBasedMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you improve my phrases like a professional?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(textBasedSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Improve",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you improve my phrases like a professional?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you summarize my content?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(textBasedSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Summarize",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you summarize my content?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you write a paragraph for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(textBasedSkillsImages[2])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Paragraph",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you write a paragraph for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you translate a text for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(textBasedSkillsImages[3])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Translate",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you translate a text for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> artSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you generate a song lyrics for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(artSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lyrics",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you generate a song lyrics for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you write a poem for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(artSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Poem",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you write a poem for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you write a story for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(artSkillsImages[2])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Story",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you write a story for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you write a short movie script for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(artSkillsImages[3])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Short Movie",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you write a short movie script for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> businessSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you generate a company name for my company?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(businessSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Company Name",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you generate a company name for my company?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you generate a company slogan for my company?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(businessSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Company Slogan",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you generate a company slogan for my company?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help about create a job description for my job post?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(businessSkillsImages[2])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Job Post",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help about create a job description for my job post?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help for write a company biography for me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(businessSkillsImages[3])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Company Bio",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help for write a company biography for me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> socialSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for write a tweet that helps get attraction?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(socialSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tweet",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for write a tweet that helps get attraction?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for a linkedin post that helps get attraction?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(socialSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Linkedin Post",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for a linkedin post that helps get attraction?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for choose instagram caption for my instagram post?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(socialSkillsImages[2])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Instagram Caption",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for choose instagram caption for my instagram post?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for choose tiktok caption for my instagram post?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(socialSkillsImages[3])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "TikTok Caption",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for choose tiktok caption for my instagram post?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for an idea about viral video for social media?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(socialSkillsImages[4])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Viral Video Ideas",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for an idea about viral video for social media?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> emailSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me about write an email content?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(mailImages)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me about write an email content?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me about write an email subject?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(mailImages)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email Subject",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me about write an email subject?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for improve an email phrases?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(mailImages)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Improve Email",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for improve an email phrases?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> codeSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you write a simple code block for me with any language?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(codeSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Write code",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you write a simple code block for me with any language?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you explain a code block to me?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(codeSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Explain code",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you explain a code block to me?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> foodSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you give me ideas about cook for dinner?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(foodSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recipe",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you give me ideas about cook for dinner?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you help me for create a diet plan?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(foodSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Diet Plan",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you help me for create a diet plan?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> entertainmentSkillsMenus = [
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you make a funny joke?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(entertainmentSkillsImages[0])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tell Joke",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you make a funny joke?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Get.off(const ChatPage(
          messageFromExplorePage: 'Can you complete my sentences with funny random answers?',
        ));
      },
      child: Card(
        color: const Color(0xff1e2d40).withOpacity(0.8),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                // border color
                color: Color.fromARGB(255, 54, 83, 120),
                // border thickness
                width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: SizedBox(height: 50, width: 50, child: Image.asset(entertainmentSkillsImages[1])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Complete Sentences",
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Can you complete my sentences with funny random answers?',
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/ico.svg',
                    color: const Color(0xff04f4bc),
                    semanticsLabel: 'Label',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Text Based Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: textBasedMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexFirstList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexFirstList ? 1 : 0.9,
                  child: textBasedMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Art Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: artSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexSecondList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexSecondList ? 1 : 0.9,
                  child: artSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Business Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: businessSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexThirdList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexThirdList ? 1 : 0.9,
                  child: businessSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Social Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: socialSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexFourList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexFourList ? 1 : 0.9,
                  child: socialSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Email Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: emailSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexFiveList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexFiveList ? 1 : 0.9,
                  child: emailSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Code Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: codeSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexSixList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexSixList ? 1 : 0.9,
                  child: codeSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Food Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: foodSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexSevenList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexSevenList ? 1 : 0.9,
                  child: foodSkillsMenus[i],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
            child: Text(
              'Entertainment Skills',
              style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: entertainmentSkillsMenus.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _indexEigthList = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _indexEigthList ? 1 : 0.9,
                  child: entertainmentSkillsMenus[i],
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
