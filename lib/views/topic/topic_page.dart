import 'package:bardly_mobile_app/views/chat/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

RxString selectedTopic = "".obs;

List<RxString> topicList = [
  "Explain quantum physics".obs,
  "What are wormholes explain like I am 5".obs,
  "Can you help me about an issue with computer science".obs
];
TextEditingController messageTextController = TextEditingController();

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
            () => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                    child: Center(
                      child: Text(
                        'Topics',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                  Card(
                    color: const Color(0xff1e2d40).withOpacity(0.9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            // border color
                            color: const Color(0xff1e2d40).withOpacity(0.1),
                            // border thickness
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 8),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.question_answer,
                                    color: Colors.white),
                                Text(
                                  "Topics",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ),
                       ListView.builder(
                    itemCount: topicList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            messageTextController.text = topicList[index].value;
                          },
                          child: Container(
                            //color: Color(0xff1e2d40).withOpacity(0.1),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Center(
                              child: Text(
                                topicList[index].value,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),],
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: messageTextController.text == ""
                                        ? "Write message..."
                                        : null,
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ChatPage()));
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 18,
                              ),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
    }
}
