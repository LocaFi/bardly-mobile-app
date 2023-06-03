import 'package:bardly_mobile_app/models/recent_chat_model.dart';
import 'package:bardly_mobile_app/views/chat/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {

  List<RecentChatModel> messagesList = [
    RecentChatModel(
        topicMessage: "Hello, Will",
        dateTime: DateTime.now()),
    RecentChatModel(
        topicMessage: "How have you been?",
        dateTime: DateTime.now()),
    RecentChatModel(
        topicMessage: "Hey Kriss, I am doing fine dude. wbu?",
        dateTime: DateTime.now()),
    RecentChatModel(
        topicMessage: "ehhhh, doing OK.",
        dateTime: DateTime.now()),
    RecentChatModel(
        topicMessage: "Is there any thing wrong?",
        dateTime: DateTime.now()),
    RecentChatModel(
        topicMessage: "Is there any thing wrong?",
        dateTime: DateTime.now()),
  ];

  final _dateFormat = DateFormat('dd--MM-yyyy hh:mm');


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: ListView.builder(
              itemCount: messagesList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:() {
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ChatPage()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _dateFormat
                                        .format(messagesList[index].dateTime),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    messagesList[index].topicMessage,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}