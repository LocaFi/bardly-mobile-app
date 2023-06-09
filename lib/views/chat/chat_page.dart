import 'dart:async';

import 'package:bardly_mobile_app/bloc/bard/bard_bloc.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_event.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_state.dart';
import 'package:bardly_mobile_app/core/database/database_helper.dart';
import 'package:bardly_mobile_app/models/bard_request_model.dart';
import 'package:bardly_mobile_app/views/chat/widgets/chat_page_widget.dart';
import 'package:bardly_mobile_app/views/chat/widgets/chat_theme.dart';
import 'package:bardly_mobile_app/views/chat/widgets/message.dart';
import 'package:bardly_mobile_app/views/chat/widgets/models/models.dart';
import 'package:bardly_mobile_app/views/chat/widgets/user.dart';
import 'package:bardly_mobile_app/views/home/home_view.dart';
import 'package:bardly_mobile_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.messageParams});
  final String? messageParams;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final int _index = 0;
  final ScrollController controller = ScrollController();
  late BardBloc bardBloc;
  var lastMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bardBloc = BardBloc();
    if (widget.messageParams != null) {
      // Message message = TextMessage(
      //   author: loggedInUser,
      //   text: widget.messageParams ?? '',
      //   time: "now",
      //   stage: 3,
      // );
      // messages.add(message);
      Future.microtask(() => setFirstMessageToDb(widget.messageParams ?? ''));
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   controller.jumpTo(controller.position.maxScrollExtent);
      // });
    }
  }

  void setFirstMessageToDb(
    String param,
  ) async {
    Message message = TextMessage(author: loggedInUser, text: widget.messageParams ?? '', time: DateTime.now().toString(), stage: 1);
    DBProvider dbProvider = DBProvider();
    var getLastId = await dbProvider.getLastHeaderId();
    dbProvider.insertChat('u', widget.messageParams ?? '', getLastId[0]['id'], '');
    setState(() {
      messages.add(message);
    });
    bardBloc.add(AskToBardEvent(BardRequestModel(question: widget.messageParams ?? '')));
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
  User bot = User(
    id: "Bardly",
    name: "Bardly",
    avatarUrl: "https://picsum.photos/id/237/200/300",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              barrierDismissible: true,
              text: 'You end the chat.\nYou can check your chats in the "recents" tab.',
              confirmBtnText: 'OK',
              confirmBtnColor: const Color(0xff33cdbb),
              onConfirmBtnTap: () async {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeView()), (route) => false);
              },
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
      ),
      backgroundColor: const Color(0xff1e2d40),
      body: BlocProvider(
        create: (context) => bardBloc,
        child: BlocConsumer<BardBloc, BardState>(
          listener: (context, state) async {
            if (state is BardWaitingState) {
              print('waiting');
              Message message = TextMessage(
                isLoading: true,
                author: bot,
                text: '',
                time: "now",
                stage: 3,
              );
              messages.add(message);
            } else {
              if (state is BardResponse) {
                messages.removeLast();
                print('bardResponse');
                print(state.model.data?.chosenAnswer.toString());
                DBProvider dbProvider = DBProvider();
                var getLastId = await dbProvider.getLastHeaderId();
                Message message;
                if (state.model.data?.details?[0].url != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.jumpTo(controller.position.maxScrollExtent);
                  });
                  message = ImageMessage(
                      onCompleted: (v) {
                        if (v == 1.0) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.jumpTo(controller.position.maxScrollExtent);
                          });
                          setState(() {});
                        } else {
                          setState(() {});
                          return;
                        }
                      },
                      author: bot,
                      time: 'now',
                      imageUrl: state.model.data?.details?[0].url ?? '',
                      caption: state.model.data?.chosenAnswer.toString());
                  dbProvider.insertChat('b', state.model.data?.chosenAnswer.toString() ?? '', getLastId[0]['id'], state.model.data?.details?[0].url ?? '');
                  setState(() {});
                } else {
                  message = TextMessage(
                    isLoading: false,
                    author: bot,
                    text: state.model.data?.chosenAnswer.toString() ?? '',
                    time: "now",
                    stage: 3,
                  );
                  dbProvider.insertChat('b', state.model.data?.chosenAnswer.toString() ?? '', getLastId[0]['id'], '');
                  setState(() {});
                }

                messages.add(message);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.jumpTo(controller.position.maxScrollExtent);
                });
                setState(() {});
              }
            }
          },
          builder: (context, state) {
            return Center(
              child: Chat(
                controller: controller,
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
                    // state is BardWaitingState ? const CircularProgressIndicator() : Container(),
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
                            onPressed: () async {
                              Message message = TextMessage(author: loggedInUser, text: messageTextController.text, time: DateTime.now().toString(), stage: 1);
                              DBProvider dbProvider = DBProvider();
                              var getLastId = await dbProvider.getLastHeaderId();
                              dbProvider.insertChat('u', messageTextController.text, getLastId[0]['id'], '');
                              setState(() {
                                messages.add(message);
                              });
                              context.read<BardBloc>().add(AskToBardEvent(BardRequestModel(question: messageTextController.text)));
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                controller.jumpTo(controller.position.maxScrollExtent);
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
            );
          },
        ),
      ),
    );
  }
}
