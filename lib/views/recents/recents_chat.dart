import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bardly_mobile_app/core/database/database_helper.dart';
import 'package:bardly_mobile_app/views/chat/widgets/chat_page_widget.dart';
import 'package:bardly_mobile_app/views/chat/widgets/chat_theme.dart';
import 'package:bardly_mobile_app/views/chat/widgets/message.dart';
import 'package:bardly_mobile_app/views/chat/widgets/models/models.dart';
import 'package:bardly_mobile_app/views/chat/widgets/user.dart';
import 'package:bardly_mobile_app/views/home/home_view.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({super.key, this.roomId, this.header});
  final int? roomId;
  final String? header;

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  final int _index = 0;
  var lastMessage;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.roomId != null) {
      Future.microtask(() => getRecentChat());
    }
  }

  Future<dynamic> getRecentChat() async {
    DBProvider dbProvider = DBProvider();
    var a = await dbProvider.getRecentChat(widget.roomId ?? 1);
    lastMessage = a;
    print(lastMessage);
    for (var i = 0; i < lastMessage.length; i++) {
      Message message = TextMessage(author: lastMessage[i]['sender'] == "u" ? loggedInUser : bot, text: lastMessage[i]['message'], time: "", stage: 1);
      messages.add(message);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent * 2);
    });
    setState(() {});
  }

  List<User> users = [];
  List<Message> messages = [];
  TextEditingController messageTextController = TextEditingController();

  User loggedInUser = User(
    id: "Putras",
    name: "Putra Silas",
    avatarUrl: "https://creatorium.org/assets/green-read-tick.png",
    color: Colors.transparent,
  );

  User bot = User(
    id: "Bardly",
    name: "Bardly",
    avatarUrl: "https://picsum.photos/id/237/200/300",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1e2d40),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Color(0xff04f4bc),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Share', style: TextStyle(color: Color(0xff04f4bc), fontSize: 18)),
                    ],
                  )),
            ),
          )),
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
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () async {
              DBProvider dbProvider = DBProvider();
              var a = await dbProvider.deleteUserData(widget.roomId ?? 1);
              print(a);
              // ignore: use_build_context_synchronously
              AnimatedSnackBar.material(
                'This conversation has been successfully deleted.',
                type: AnimatedSnackBarType.success,
                mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
              ).show(context);
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeView(
                            navigate: true,
                          )));

              // Future.microtask(() => getRecentChat()).whenComplete(() => setState(() {}));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 6.0),
              child: SvgPicture.asset(
                'assets/delete_icon.svg',
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xff1e2d40).withOpacity(0.3),
      body: Center(
        child: Chat(
            isRecentChat: true,
            controller: controller,
            user: loggedInUser,
            messages: messages,
            theme: DefaultChatTheme(
              backgroundImage: null,
              userAvatarRadius: 12,
              defaultUserColor: const Color(0xff04f4bc).withOpacity(0.6),
              usernameTextStyle: const TextStyle(color: Color(0xff04f4bc)),
              timeTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
            showUserAvatar: true,
            input: Container()),
      ),
    );
  }
}
