import 'package:bardly_mobile_app/core/database/database_helper.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_chat_ui/mobile_chat_ui.dart';
import 'package:mobile_chat_ui/models/chat_theme.dart';
import 'package:mobile_chat_ui/models/messages/message.dart';
import 'package:mobile_chat_ui/models/messages/types.dart';
import 'package:mobile_chat_ui/models/user.dart';

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
    print(lastMessage[0]['message']);
    Message message = TextMessage(author: User(id: "0de4krd0sas-49iecxo203rji", name: 'Demo'), text: widget.header ?? '', time: "now", stage: 1);
    messages.add(message);
    for (var i = 0; i < lastMessage.length; i++) {
      message = TextMessage(author: User(id: "0de4krd0sas-49iecxo203rji", name: 'Demo'), text: lastMessage[i]['message'], time: "now", stage: 1);
      messages.add(message);
    }

    setState(() {});
  }

  List<User> users = [];
  List<Message> messages = [];
  TextEditingController messageTextController = TextEditingController();

  User loggedInUser = User(
    id: "Putras",
    name: "Putra Silas",
    avatarUrl: "https://randomuser.me/api/portraits/women/92.jpg",
    color: const Color(0xff1e2d40),
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
                  child: const Text('Share', style: TextStyle(color: Color(0xff04f4bc), fontSize: 18))),
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
      ),
      backgroundColor: const Color(0xff1e2d40),
      body: Center(
        child: Chat(
          user: loggedInUser,
          messages: messages,
          theme: DefaultChatTheme(
            userAvatarRadius: 12,
          ),
          showUserAvatar: true,
          input: widget.roomId != null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
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
                              style: const TextStyle(color: Colors.white),
                              decoration:
                                  InputDecoration(hintText: messageTextController.text == "" ? "Write message..." : null, hintStyle: const TextStyle(color: Colors.white), border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Message message = TextMessage(author: User(id: "0de4krd0sas-49iecxo203rji", name: 'Demo'), text: messageTextController.text, time: "now", stage: 1);
                              DBProvider dbProvider = DBProvider();
                              dbProvider.insertChat(
                                'u',
                                messageTextController.text,
                                widget.roomId?.toInt() ?? 1,
                              );
                              setState(() {
                                messages.add(message);
                              });
                              messageTextController.text = "";

                              // Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatPage()));
                            },
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          // input: ChatInput(
          //   user: User(id: '0de4krd0sas-49iecxo203rji', name: 'ASD'),
          //   onSend: (v) {
          //     DBProvider dbProvider = DBProvider();
          //     messages.add(v);
          //   },
          // ),
        ),
      ),
    );
  }
}
