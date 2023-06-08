import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

int _indexForNavigate = 0;
int _index = 0;

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                  child: Text(
                    'Text Based Skills',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: const Color(0xff1e2d40).withOpacity(0.8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  // border color
                                  color:
                                      Color.fromARGB(255, 54, 83, 120),
                                  // border thickness
                                  width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 8),
                                child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset('assets/book.png')),
                              ),
                               Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Generate AI Story",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white.withOpacity(0.7)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Create a story with the help of AI.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, bottom: 12),
                                    child: SvgPicture.asset(
                                      'assets/ico.svg',
                                      color: const Color(0xff04f4bc),
                                      semanticsLabel: 'Label',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
                  child: Text(
                    'Translate Skills',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: const Color(0xff1e2d40).withOpacity(0.8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  // border color
                                  color:
                                      const Color.fromARGB(255, 54, 83, 120),
                                  // border thickness
                                  width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8),
                                child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset('assets/translate.png')),
                              ),
                               Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Translate to English",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white.withOpacity(0.7)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Translate any language to English.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, bottom: 12),
                                    child: SvgPicture.asset(
                                      'assets/ico.svg',
                                      color: const Color(0xff04f4bc),
                                      semanticsLabel: 'Label',
                                    ),
                                  ),
                                ],
                              ),
                            ],
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