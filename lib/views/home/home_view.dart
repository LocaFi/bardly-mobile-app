import 'dart:math';

import 'package:bardly_mobile_app/core/database/database_helper.dart';
import 'package:bardly_mobile_app/views/chat/chat_page.dart';
import 'package:bardly_mobile_app/views/chat/widgets/message.dart';
import 'package:bardly_mobile_app/views/chat/widgets/user.dart';
import 'package:bardly_mobile_app/views/explore/explore_page.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:bardly_mobile_app/views/recent/recent_page.dart';
import 'package:bardly_mobile_app/views/settings/settings_view.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.navigate, this.isComingFromRecent}) : super(key: key);
  final bool? navigate;
  final bool? isComingFromRecent;
  @override
  State<HomeView> createState() => _HomeViewState();
}

int _indexForNavigate = 0;

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageTextController.text = "";
    if (widget.navigate == true) {
      setState(() {
        _indexForNavigate = 0;
      });
    }
    // if (widget.isComingFromRecent == true) {
    //   setState(() {
    //     controller.jumpToPage(_indexForNavigate);
    //   });
    // }
  }

  final PageController controller = PageController();
  List<User> users = [];
  List<Message> messages = [];
  User loggedInUser = User(
    id: "Putras",
    name: "Putra Silas",
    avatarUrl: "https://randomuser.me/api/portraits/women/92.jpg",
    color: const Color(0xff1e2d40),
  );
  final rand = Random();
  RxString topic1 = "What's your skills?".obs;
  RxString topic2 = "Act like a magician".obs;
  RxString topic3 = "Write a tweet".obs;
  TextEditingController messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff1e2d40),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title:

            // const GradientText(
            //   'Bardly',
            //   style: TextStyle(fontSize: 30, fontFamily: 'Anton'),
            //   gradient: LinearGradient(colors: [
            //     Color(0xff00ffc3),
            //     Color(0xff04f4bc),
            //   ]),
            // ),

            Row(
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
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsView()));
              },
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 54, 83, 120),
                radius: 22,
                child: SvgPicture.asset(
                  'assets/a.svg',
                  semanticsLabel: 'Label',
                  color: Colors.white.withOpacity(0.7),
                  height: 28,
                  width: 28,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff1e2d40).withOpacity(0.7),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: const Color(0xff1e2d40),
        color: const Color(0xff00ffc3),
        selectedIndex: _indexForNavigate,
        items: [
          BottomBarItem(
            iconData: CupertinoIcons.chat_bubble_2_fill,
            label: 'Chat',
          ),
          BottomBarItem(
            iconData: Icons.menu_open_outlined,
            label: 'Explore',
          ),
          BottomBarItem(
            iconData: CupertinoIcons.timer,
            label: 'Recents',
          ),
        ],
        onSelect: (index) {
          // implement your select function here
          print(index.toString());
          controller.jumpToPage(index);
          setState(() {
            _indexForNavigate = index;
          });
        },
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 40, bottom: 12),
                  child: Center(
                    child: Text(
                      'New Chat Topics',
                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 24),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 15),
                          child: Card(
                            color: const Color(0xff1e2d40).withOpacity(0.9),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    // border color
                                    color: const Color(0xff1e2d40).withOpacity(0.1),
                                    // border thickness
                                    width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.question_answer,
                                      color: Colors.white.withOpacity(0.7),
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Topics",
                                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 24),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      messageTextController.text = topic1.value;
                                    },
                                    child: Container(
                                      //color: Color(0xff1e2d40).withOpacity(0.1),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color.fromARGB(255, 54, 83, 120)), borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 54, 83, 120)),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          topic1.value,
                                          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      messageTextController.text =
                                          'want you to act as a magician. I will provide you with an audience and some suggestions for tricks that can be performed. My first request is I want you to make my watch disappear';
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color.fromARGB(255, 54, 83, 120)), borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 54, 83, 120)),
                                      //color: Color(0xff1e2d40).withOpacity(0.1),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          topic2.value,
                                          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 15),
                                  child: InkWell(
                                    onTap: () {
                                      messageTextController.text = 'Write a tweet that can go viral on Twitter nowadays.';
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color.fromARGB(255, 54, 83, 120)), borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 54, 83, 120)),
                                      //color: Color(0xff1e2d40).withOpacity(0.1),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          topic3.value,
                                          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 0.1),
                    color: const Color(0xff1e2d40),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Container(
                      //     height: 30,
                      //     width: 30,
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xff1e2d40),
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     child:  Icon(
                      //       Icons.add,
                      //       color: Colors.white.withOpacity(0.7),
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Expanded(
                          child: TextField(
                            controller: messageTextController,
                            style: TextStyle(color: Colors.white.withOpacity(0.7)),
                            decoration: InputDecoration(
                                hintText: messageTextController.text == "" ? "Write message..." : "", hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)), border: InputBorder.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          if (messageTextController.text.trim() == "") {
                            return;
                          }
                          DBProvider dbProvider = DBProvider();
                          dbProvider.insertRoomTable(messageTextController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatPage(
                                        messageParams: messageTextController.text,
                                      )));
                        },
                        backgroundColor: const Color(0xff1e2d40),
                        elevation: 0,
                        child: Icon(
                          Icons.send,
                          color: Colors.white.withOpacity(0.7),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ExplorePage(),
          const RecentPage(),
        ],
      ),
    );
  }
}
