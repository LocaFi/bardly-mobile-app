import 'package:bardly_mobile_app/views/chat/widgets/chat_input.dart';
import 'package:bardly_mobile_app/views/chat/widgets/chat_theme.dart';
import 'package:bardly_mobile_app/views/chat/widgets/message.dart';
import 'package:bardly_mobile_app/views/chat/widgets/user.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat(
      {Key? key,
      required this.user,
      required this.theme,
      required this.messages,
      this.showUserAvatar = false,
      this.showUsername = true,
      this.showMessageStatus = false,
      this.hasInput = true,
      this.isLoading = false,
      this.isRecentChat = false,
      this.input,
      required this.controller})
      : super(key: key);

  final ChatTheme theme;
  List<Message> messages;
  final bool showUserAvatar;
  final bool showUsername;
  final bool showMessageStatus;
  final User user;
  final bool hasInput;
  final Widget? input;
  final bool? isLoading;
  final ScrollController controller;
  final bool? isRecentChat;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: widget.theme.bodyPadding,
            decoration: BoxDecoration(
              color: widget.theme.backgroundColor,
              image: widget.theme.backgroundImage,
            ),
            child: SingleChildScrollView(
              controller: widget.controller,
              child: Column(
                children: [
                  Column(
                    children: widget.isLoading == true
                        ? [
                            Image.asset(
                              "assets/think.gif",
                              height: 125.0,
                              width: 125.0,
                            ),
                          ]
                        : widget.messages.map((e) => e.builder(context, widget.showUserAvatar, widget.showMessageStatus, widget.showUsername, widget.user, widget.theme)).toList(),
                  ),
                  widget.isRecentChat == true
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 8,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        widget.hasInput
            ? widget.input ??
                ChatInput(
                  user: widget.user,
                  onSend: (message) {
                    setState(() {
                      widget.messages.add(message);
                    });
                  },
                )
            : const SizedBox(),
        widget.isRecentChat == true
            ? const SizedBox(
                height: 30,
              )
            : const SizedBox()
      ],
    );
  }
}
