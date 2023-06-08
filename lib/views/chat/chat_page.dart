import 'package:bardly_mobile_app/core/database/database_helper.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_chat_ui/mobile_chat_ui.dart';
import 'package:mobile_chat_ui/models/chat_theme.dart';
import 'package:mobile_chat_ui/models/messages/message.dart';
import 'package:mobile_chat_ui/models/messages/types.dart';
import 'package:mobile_chat_ui/models/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.messageParams});
  final String? messageParams;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final int _index = 0;
  final ScrollController controller = ScrollController();

  var lastMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.messageParams != null) {
      Message message = TextMessage(
        author: loggedInUser,
        text: widget.messageParams ?? '',
        time: "now",
        stage: 3,
      );
      messages.add(message);
      Future.microtask(() => setFirstMessageToDb(widget.messageParams ?? ''));
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   controller.jumpTo(controller.position.maxScrollExtent);
      // });
    }
  }

  void setFirstMessageToDb(String param) async {
    DBProvider dbProvider = DBProvider();
    var getLastId = await dbProvider.getLastHeaderId();
    dbProvider.insertChat(
      'u',
      param,
      getLastId[0]['id'],
    );
  }

  List<User> users = [];
  List<Message> messages = [];
  TextEditingController messageTextController = TextEditingController();

  User loggedInUser = User(
    id: "0de4krd0sas-49iecxo203rji",
    name: "User",
    avatarUrl: "https://creatorium.org/assets/green-read-tick.png",
    color: const Color(0xff1e2d40),
  );

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
        title:
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
          
        ],
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
          input: Column(
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
                        decoration: InputDecoration(hintText: messageTextController.text == "" ? "Write message..." : null, hintStyle: const TextStyle(color: Colors.white), border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        Message message = TextMessage(author: loggedInUser, text: messageTextController.text, time: DateTime.now().toString(), stage: 1);
                        DBProvider dbProvider = DBProvider();
                        var getLastId = await dbProvider.getLastHeaderId();
                        dbProvider.insertChat(
                          'u',
                          messageTextController.text,
                          getLastId[0]['id'],
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
