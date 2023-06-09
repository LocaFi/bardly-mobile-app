import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bardly_mobile_app/views/home/home_view.dart';
import 'package:bardly_mobile_app/views/history/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../core/database/database_helper.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  // List<RecentChatModel> messagesList = [
  //   RecentChatModel(topicMessage: "Hello, Will", dateTime: DateTime.now()),
  //   RecentChatModel(topicMessage: "How have you been?", dateTime: DateTime.now()),
  //   RecentChatModel(topicMessage: "Hey Kriss, I am doing fine dude. wbu?", dateTime: DateTime.now()),
  //   RecentChatModel(topicMessage: "ehhhh, doing OK.", dateTime: DateTime.now()),
  //   RecentChatModel(topicMessage: "Is there any thing wrong?", dateTime: DateTime.now()),
  //   RecentChatModel(topicMessage: "Is there any thing wrong?", dateTime: DateTime.now()),
  // ];

  final _dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  List<Map> getUserDataFromDB = [];
  List<int> deleteFromDB = [];
  List<int> selectedItems = [-1];
  bool isAllSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => getDatas());
  }

  Future<dynamic> getDatas() async {
    DBProvider dbProvider = DBProvider();
    var a = await dbProvider.getRoomHeader();

    getUserDataFromDB = a;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return getUserDataFromDB.isEmpty
        ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/empty.png',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Conversation not found.',
                      style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeView(
                                      navigate: true,
                                    )));
                      },
                      child: const Text(
                        'Start a conversation.',
                        style: TextStyle(fontFamily: 'Ubuntu', color: Color(0xff00ffc3)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                selectedItems.length > 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (isAllSelected) {
                                    DBProvider dbProvider = DBProvider();
                                    dbProvider.clearAllData();
                                  } else {
                                    DBProvider dbProvider = DBProvider();
                                    for (var element in deleteFromDB) {
                                      var a = await dbProvider.deleteUserData(element);
                                      print(a);
                                    }
                                  }
                                  print(selectedItems);
                                  print(deleteFromDB);

                                  // for (var i = 0; i <= deleteFromDB.length; i++) {

                                  // }
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
                                child: SvgPicture.asset(
                                  'assets/delete_icon.svg',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    isAllSelected = !isAllSelected;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/all.svg',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  child: ListView.builder(
                    itemCount: getUserDataFromDB.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          if (selectedItems.contains(index)) {
                            setState(() {
                              selectedItems.removeAt(index);
                            });
                          } else {
                            setState(() {
                              selectedItems.add(index);
                              deleteFromDB.add(getUserDataFromDB[index]["id"]);
                            });
                          }
                        },
                        onTap: () {
                          if (selectedItems.length == 1) {
                            DBProvider dbProvider = DBProvider();
                            dbProvider.getRecentChat(getUserDataFromDB[index]["id"]);
                            print(getUserDataFromDB[index]["id"]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChatHistoryPage(
                                          header: getUserDataFromDB[index]["header"],
                                          roomId: getUserDataFromDB[index]["id"].toInt(),
                                        )));
                          } else if (selectedItems.contains(index)) {
                            setState(() {
                              selectedItems.remove(index);
                            });
                            return;
                          } else if (!selectedItems.contains(index)) {
                            setState(() {
                              selectedItems.add(index);
                              deleteFromDB.add(getUserDataFromDB[index]["id"]);
                            });
                            return;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isAllSelected == true
                                    ? const Color.fromARGB(255, 54, 83, 120)
                                    : (selectedItems.contains(index) == true ? const Color.fromARGB(255, 54, 83, 120) : const Color.fromARGB(255, 54, 83, 120).withOpacity(0.5)),
                              ),
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 12,
                                top: 12,
                              ),
                              child: Row(
                                children: [
                                  const Expanded(
                                      child: Column(
                                    children: [
                                      Icon(
                                        Icons.message_outlined,
                                        color: Color(0xff00ffc3),
                                        size: 30,
                                      )
                                    ],
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getUserDataFromDB[index]['created_at'],
                                          style: const TextStyle(fontSize: 15, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            (getUserDataFromDB.isNotEmpty ? getUserDataFromDB[index]["header"].toString() : "").length > 64
                                                ? "${(getUserDataFromDB.isNotEmpty ? getUserDataFromDB[index]["header"].toString() : "").substring(0, 64)}..."
                                                : getUserDataFromDB.isNotEmpty
                                                    ? getUserDataFromDB[index]["header"].toString()
                                                    : "",
                                            style: TextStyle(fontFamily: 'Ubuntu', fontSize: 16, color: Colors.white.withOpacity(0.7)),
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
                ),
              ],
            ),
          );
  }
}
