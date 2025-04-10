import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dbprodweb/consts/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController pageController = PageController();
  AnimatedTextController textController1 = AnimatedTextController();
  AnimatedTextController textController2 = AnimatedTextController();
  AnimatedTextController textController3 = AnimatedTextController();
  AnimatedTextController textController4 = AnimatedTextController();
  AnimatedTextController textController5 = AnimatedTextController();
  bool text1Hovered = false;
  bool text2Hovered = false;
  bool text3Hovered = false;
  bool text4Hovered = false;
  int currentIndex = 0;
  bool textHighlighted1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo-white.png'),
              const SizedBox(width: 100,),
                InkWell(child: Text('About Us', style: text1Hovered?HoverHeaderStyle:headerStyle,), onHover: (v)=>{setState(() {

                  text1Hovered = v;

                })},),
              Text('About Us'),
            Text('About Us'),
            Text('About Us'),
               Image.asset(
                  'assets/rec.png',
                  fit: BoxFit.fill,
                  width: 120,
                  height: 100,
                ),
              ],
            ),
          )),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),

          ScrollConfiguration(
            behavior: const CupertinoScrollBehavior(),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: double.infinity,
                    width: double.infinity,
                    child: DefaultTextStyle(
                      style: GoogleFonts.aleo()
                          .copyWith(fontSize: 40, color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedTextKit(
                            controller: textController1,
                            animatedTexts: [
                              FadeAnimatedText('Who We Are',
                                  fadeInEnd: 0, fadeOutBegin: 1)
                            ],
                            isRepeatingAnimation: false,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: PageView(
                        onPageChanged: (int index) {
                          switch (index) {
                            case 0:
                              textController1.play();
                            case 1:
                              textController2.play();
                            case 2:
                              textController3.play();
                            case 3:
                              textController4.play();
                            case 4:
                              textController5.play();
                          }
                        },
                        scrollDirection: Axis.vertical,
                        scrollBehavior: const CupertinoScrollBehavior(),
                        controller: pageController,
                        children: [
                          Container(
                            color: Colors.white.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.yellow.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.amberAccent.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.yellow.withOpacity(0.1),
                          ),
                          Container(
                            color: Colors.amberAccent.withOpacity(0.1),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
