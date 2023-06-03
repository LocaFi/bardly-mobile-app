import 'dart:convert';
import 'dart:math';

import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
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
int _index = 0;

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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

  void loadData() async {
    Response response = await get(Uri.parse("https://randomuser.me/api/?results=50"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (dynamic item in data['results']) {
        users.add(
          User(
            id: item['login']['uuid'],
            avatarUrl: item['picture']['thumbnail'],
            name: item['name']['first'] + " " + item['name']['last'],
            color: Colors.white,
            isVerified: rand.nextBool(),
          ),
        );
      }
      messages = [
        TimeStampMessage(displayTime: "Today"),
        TextMessage(author: users[Random().nextInt(users.length)], time: "12:00 PM", text: "Hello house, we shall be having a brief meeting in this group tonight by 8:00pm UTC."),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "Victor Aniedi joined the group chat via group invite link"),
        TextMessage(
          author: loggedInUser,
          time: "12:21 PM",
          text: "Victor Aniedi, you are welcome to this group chat.",
          stage: 1,
        ),
        AudioMessage(
          author: users[Random().nextInt(users.length)],
          time: "1:06 PM",
        ),
        TextMessage(
          author: users[Random().nextInt(users.length)],
          time: "1:14 PM",
          text: "Please check out this link. It's really something you'll like \n\nhttps://github.com/ayzerobug",
        ),
        ImageMessage(
            author: users[Random().nextInt(users.length)],
            time: "2:00 PM",
            imageUrl: "https://i.picsum.photos/id/640/500/300.jpg?hmac=e6ieOM3S96AHu6Hf8KinhKcN5BkwvRj-9IP1o0Ozbdw",
            caption: "Someone sent this picture to me yesterday. \n\n What as it for?"),
        ImageMessage(
            author: users[Random().nextInt(users.length)],
            time: "12:00 PM",
            imageUrl: "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
            caption:
                "Mollit tempor ea quis laborum ipsum velit ea elit sunt nisi. Ipsum amet commodo sint magna velit in sint eu ipsum reprehenderit in incididunt sint fugiat. Consectetur sit laborum commodo cupidatat. Velit aliquip minim officia consequat. Nisi eu Lorem proident incididunt."),
        TextMessage(
            author: users[Random().nextInt(users.length)],
            time: "12:01 PM",
            text: "Good Afternoon, may i ask your help to make a real estate landing page, for more details i will send as soon as you provide it. Thanks"),
        TextMessage(author: loggedInUser, time: "12:10 PM", text: "Haii, Micheal!", stage: 2),
        TextMessage(
            author: loggedInUser,
            time: "12:10 PM",
            text: "Thank you for the offer you gave me, yes I will accept the project from you, for the brief please send it now so i can study it first.",
            stage: 2),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "John Doe joined the group chat via group invite link"),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "The Real Kind of Vibe and More joined the group chat via group invite link"),
        DocumentMessage(author: users[Random().nextInt(users.length)], time: "12:28 PM", documentFormat: "DOCX", documentSize: "32 kb", documentName: "Brief Project Real Estate Landing Page"),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "James left the group chat"),
        AudioMessage(
          author: users[Random().nextInt(users.length)],
          time: "now",
        ),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "Victor joined the group chat via group invite link"),
        ActionMessage(author: users[Random().nextInt(users.length)], time: "now", text: "James added Johnson Adekunle"),
        TextMessage(
          author: loggedInUser,
          time: "12:33 PM",
          text: "Ohh i see, for payment we can directly discuss now",
          stage: 1,
        ),
        AudioMessage(
          author: loggedInUser,
          time: "now",
          stage: 2,
        ),
        TextMessage(
          author: users[Random().nextInt(users.length)],
          time: "12:10 PM",
          text: "Please check out this link. It's really something you'll like \n\nhttps://github.com/ayzerobug",
        ),
        ImageMessage(
            author: loggedInUser,
            time: "12:00 PM",
            stage: 1,
            imageUrl: "https://img.gadgethacks.com/img/55/43/63742419720670/0/pick-different-chat-wallpapers-for-whatsapps-light-dark-modes-for-even-more-control-over-your-theme.1280x600.jpg",
            caption:
                "Mollit tempor ea quis laborum ipsum velit ea elit sunt nisi. Ipsum amet commodo sint magna velit in sint eu ipsum reprehenderit in incididunt sint fugiat. Consectetur sit laborum commodo cupidatat. Velit aliquip minim officia consequat. Nisi eu Lorem proident incididunt."),
      ];
      setState(() {});
    }
  }

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
              decoration: BoxDecoration(color: const Color(0xff04f4bc).withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
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
                backgroundImage: NetworkImage('https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png'),
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
          Center(
            child: Chat(
              user: loggedInUser,
              messages: messages,
              theme: DefaultChatTheme(
                userAvatarRadius: 12,
              ),
              showUserAvatar: true,
              input: const ChatInput(),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                  child: Text(
                    'Text Based Skills',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: const Color(0xff1e2d40).withOpacity(0.8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  // border color
                                  color: const Color(0xff00ffc3).withOpacity(0.3),
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
                                padding: const EdgeInsets.only(left: 8.0, top: 8),
                                child: SizedBox(height: 50, width: 50, child: Image.asset('assets/book.png')),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Generate AI Story",
                                  style: TextStyle(fontSize: 24, color: Colors.white),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Create a story with the help of AI.',
                                  style: TextStyle(color: Colors.grey),
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
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                  child: Text(
                    'Translate Skills',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: const Color(0xff1e2d40).withOpacity(0.8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  // border color
                                  color: const Color(0xff00ffc3).withOpacity(0.3),
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
                                padding: const EdgeInsets.only(left: 8.0, top: 8),
                                child: SizedBox(height: 50, width: 50, child: Image.asset('assets/translate.png')),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Translate to English",
                                  style: TextStyle(fontSize: 24, color: Colors.white),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Translate any language to English.',
                                  style: TextStyle(color: Colors.grey),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
              'Third Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
