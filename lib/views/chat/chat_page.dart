import 'dart:async';

import 'package:bardly_mobile_app/bloc/bard/bard_bloc.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_event.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_state.dart';
import 'package:bardly_mobile_app/controller/project_controller.dart';
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
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.messageParams, this.messageFromExplorePage});
  final String? messageParams;
  final String? messageFromExplorePage;

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
    } else if (widget.messageFromExplorePage != null) {
      Future.microtask(() => setFirstMessageToDbForExplorePage(widget.messageFromExplorePage ?? ''));
    }
  }

  void setFirstMessageToDbForExplorePage(
    String param,
  ) async {
    try {
      final dateFormat = DateFormat('dd/MM/yyyy hh:mm');

      Message message = TextMessage(author: loggedInUser, text: widget.messageFromExplorePage ?? '', time: dateFormat.format(DateTime.now()).toString(), stage: 1);
      DBProvider dbProvider = DBProvider();
      dbProvider.insertRoomTable(widget.messageFromExplorePage ?? '');
      var getLastId = await dbProvider.getLastHeaderId();
      dbProvider.insertChat('u', widget.messageFromExplorePage ?? '', getLastId[0]['id'] ?? '', '');
      setState(() {
        messages.add(message);
      });

      bardBloc.add(AskToBardEvent(BardRequestModel(question: widget.messageFromExplorePage ?? '')));
    } catch (e) {}
  }

  void setFirstMessageToDb(
    String param,
  ) async {
    try {
      final dateFormat = DateFormat('dd/MM/yyyy hh:mm');

      Message message = TextMessage(author: loggedInUser, text: widget.messageParams ?? '', time: dateFormat.format(DateTime.now()).toString(), stage: 1);
      DBProvider dbProvider = DBProvider();
      //dbProvider.insertRoomTable(widget.messageParams ?? '');
      var getLastId = await dbProvider.getLastHeaderId();
      dbProvider.insertChat('u', widget.messageParams ?? '', getLastId[0]['id'] ?? '', '');
      setState(() {
        messages.add(message);
      });

      bardBloc.add(AskToBardEvent(BardRequestModel(question: widget.messageParams ?? '')));
    } catch (e) {}
  }

  List<User> users = [];
  List<Message> messages = [];
  TextEditingController messageTextController = TextEditingController();

  User loggedInUser = User(
    id: "0de4krd0sas-49iecxo203rji",
    name: "User",
    avatarUrl: "https://creatorium.org/assets/green-read-tick.png",
    color: Colors.white,
  );
  User bot = User(
    id: "Assistly",
    name: "Assistly",
    avatarUrl: "https://creatorium.org/assets/bardly_logo.png",
    color: const Color.fromARGB(255, 8, 217, 168),
  );

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy hh:mm');

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: BlocProvider(
            create: (context) => bardBloc,
            child: BlocConsumer<BardBloc, BardState>(
              listener: (context, state) {},
              builder: (context, state) {
                return IconButton(
                  color: Colors.white,
                  onPressed: state is BardWaitingState
                      ? () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.warning,
                            barrierDismissible: true,
                            text: 'Leaving the chat without waiting for the Assistly to respond causes conversations not to be recorded in the history.',
                            confirmBtnText: 'Got it!',
                            confirmBtnColor: const Color(0xff007d81),
                            onConfirmBtnTap: () async {
                              Navigator.pop(context);
                            },
                          );
                        }
                      : () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            barrierDismissible: true,
                            text: 'You end the chat.\nYou can check your chats in the "recents" tab.',
                            confirmBtnText: 'OK',
                            confirmBtnColor: const Color(0xff33cdbb),
                            onConfirmBtnTap: state is BardWaitingState
                                ? null
                                : () async {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const HomeView(
                                                  navigate: true,
                                                )),
                                        (route) => false);
                                  },
                          );
                        },
                  icon: const Icon(Icons.arrow_back_ios),
                );
              },
            ),
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
                  'Assistly',
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
        backgroundColor: const Color(0xff090e14),
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
                if (state is BardErrorState) {
                  if (state.error == "requiredUpdate") {
                    messages.removeLast();
                    Message message = TextMessage(
                      isLoading: false,
                      author: bot,
                      text: "new version is available. I'm directing you now.",
                      time: dateFormat.format(DateTime.now()).toString(),
                      stage: 3,
                    );
                    messages.add(message);
                    DBProvider dbProvider = DBProvider();
                    var getLastId = await dbProvider.getLastHeaderId();
                    dbProvider.insertChat('b', "new version is available. I'm directing you now.", getLastId[0]['id'], '');
                    ProjectController projectController = Get.put(ProjectController());
                    projectController.forceUpdateRequired();
                  }
                }

                if (state is BardResponse) {
                  messages.removeLast();
                  print(state.model.data?.chosenAnswer.toString());
                  DBProvider dbProvider = DBProvider();
                  var getLastId = await dbProvider.getLastHeaderId();
                  Message message;
                  if (state.model.data?.details?[0].url != null) {
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
                        time: dateFormat.format(DateTime.now()).toString(),
                        imageUrl: state.model.data?.details?[0].url ?? '',
                        caption: state.model.data?.chosenAnswer?.toString());
                    dbProvider.insertChat('b', state.model.data?.chosenAnswer?.toString() ?? '', getLastId[0]['id'], state.model.data?.details?[0].url ?? '');
                  } else {
                    message = TextMessage(
                      isLoading: false,
                      author: bot,
                      text: state.model.data?.chosenAnswer.toString() ?? '',
                      time: dateFormat.format(DateTime.now()).toString(),
                      stage: 3,
                    );
                    dbProvider.insertChat('b', state.model.data?.chosenAnswer.toString() ?? '', getLastId[0]['id'], '');
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
                    backgroundImage: null,
                    backgroundColor: const Color(0xff090e14),
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
                        color: const Color(0xff1e2d40),
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                controller: messageTextController,
                                style: TextStyle(color: Colors.white.withOpacity(0.7)),
                                decoration: InputDecoration(
                                    hintText: messageTextController.text == "" ? "Write message..." : "", hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)), border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: state is BardWaitingState
                                  ? null
                                  : () async {
                                      if (messageTextController.text.trim() == "") {
                                        return;
                                      }
                                      Message message = TextMessage(author: loggedInUser, text: messageTextController.text, time: dateFormat.format(DateTime.now()).toString(), stage: 1);
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
      ),
    );
  }
}
