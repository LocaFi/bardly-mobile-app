import 'dart:convert';
import 'dart:math';

import 'package:bardly_mobile_app/models/chat_message_model.dart';
import 'package:bardly_mobile_app/models/recent_chat_model.dart';
import 'package:bardly_mobile_app/views/chat/chat_page.dart';
import 'package:bardly_mobile_app/views/explore/explore_page.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:bardly_mobile_app/views/recent/recent_page.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mobile_chat_ui/custom_widgets/chat_input.dart';
import 'package:mobile_chat_ui/mobile_chat_ui.dart';
import 'package:mobile_chat_ui/models/chat_theme.dart';
import 'package:mobile_chat_ui/models/messages/message.dart';
import 'package:mobile_chat_ui/models/messages/types.dart';
import 'package:mobile_chat_ui/models/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

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
  RxString topic1 = "Explain quantum physics".obs;
  RxString topic2 = "What are wormholes explain like I am 5".obs;
  RxString topic3 = "What are wormholes explain like I am 5".obs;
  TextEditingController messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1e2d40),
        automaticallyImplyLeading: false,
        title: const GradientText(
          'Bardly',
          style: TextStyle(fontSize: 30, fontFamily: 'Anton'),
          gradient: LinearGradient(colors: [
            Color(0xff00ffc3),
            Color(0xff04f4bc),
          ]),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff04f4bc).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Get Premium',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(
                    'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png'),
                backgroundColor: Colors.transparent,
              ))
        ],
      ),
      backgroundColor: const Color(0xff1e2d40),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: const Color(0xff1e2d40),
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
            () => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                    child: Center(
                      child: Text(
                        'Chat Topics',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                  Card(
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
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.question_answer,
                                    color: Colors.white),
                                Text(
                                  "Topics",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              messageTextController.text = topic1.value;
                            },
                            child: Container(
                              //color: Color(0xff1e2d40).withOpacity(0.1),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.transparent),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(
                                child: Text(
                                  topic1.value,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              messageTextController.text = topic2.value;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.transparent),
                              //color: Color(0xff1e2d40).withOpacity(0.1),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(
                                child: Text(
                                  topic2.value,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              messageTextController.text = topic3.value;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.transparent),
                              //color: Color(0xff1e2d40).withOpacity(0.1),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(
                                child: Text(
                                  topic3.value,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                controller: messageTextController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: messageTextController.text == ""
                                        ? "Write message..."
                                        : null,
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ChatPage()));
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 18,
                              ),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ExplorePage(),
          RecentPage(),
        ],
      ),
    );
  }
}
