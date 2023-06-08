import 'package:bardly_mobile_app/views/chat/widgets/chat_theme.dart';
import 'package:bardly_mobile_app/views/chat/widgets/user.dart';
import 'package:flutter/material.dart';

abstract class Message {
  User? author;
  String? time;
  int? stage;

  Message({this.author, this.time = "now", this.stage});

  Widget builder(BuildContext ctx, bool showUserAvatar, bool showMessageStatus, bool showUsername, User loggedInUser, ChatTheme theme);
}
