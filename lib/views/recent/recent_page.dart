import 'package:bardly_mobile_app/models/recent_chat_model.dart';
import 'package:bardly_mobile_app/views/recents/recents_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/database/database_helper.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  List<RecentChatModel> messagesList = [
    RecentChatModel(topicMessage: "Hello, Will", dateTime: DateTime.now()),
    RecentChatModel(topicMessage: "How have you been?", dateTime: DateTime.now()),
    RecentChatModel(topicMessage: "Hey Kriss, I am doing fine dude. wbu?", dateTime: DateTime.now()),
    RecentChatModel(topicMessage: "ehhhh, doing OK.", dateTime: DateTime.now()),
    RecentChatModel(topicMessage: "Is there any thing wrong?", dateTime: DateTime.now()),
    RecentChatModel(topicMessage: "Is there any thing wrong?", dateTime: DateTime.now()),
  ];

  final _dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  List<Map> deneme = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => getDatas());
  }

  Future<dynamic> getDatas() async {
    DBProvider dbProvider = DBProvider();
    var a = await dbProvider.getRoomHeader();

    deneme = a;

    print(a);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: deneme.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              DBProvider dbProvider = DBProvider();
              dbProvider.getRecentChat(deneme[index]["id"]);
              print(deneme[index]["id"]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RecentChats(
                            header: deneme[index]["header"],
                            roomId: deneme[index]["id"].toInt(),
                          )));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    top: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _dateFormat.format(messagesList[index].dateTime),
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                deneme.isNotEmpty ? deneme[index]["header"].toString() : "",
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 60,
                          width: 100,
                          // Uploading the Image from Assets
                          child: Image.asset(
                            'assets/b.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ))
                    ],
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
