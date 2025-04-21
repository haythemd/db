import 'package:carousel_slider/carousel_slider.dart';
import 'package:dbprodweb/consts/text.dart';
import 'package:dbprodweb/mapWidget.dart';
import 'package:dbprodweb/videoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  final PageController pageController = PageController();
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController controller4;
  late AnimationController contentController1;
  late AnimationController contentController2;
  late AnimationController contentController3;
  late AnimationController contentController4;
  int currentIndex = 0;
  CarouselSliderController sliderController = CarouselSliderController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double text1Opacity = 0;
  double text2Opacity = 0;
  double text3Opacity = 0;
  double text4Opacity = 0;
  bool textHighlighted1 = false;
  final defaultDuration = const Duration(milliseconds: 1500);
  final smallDuration = const Duration(milliseconds: 500);
  final ColorFilter greyscale = const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
  @override
  void initState() {
    controller1 = AnimationController(vsync: this);
    controller2 = AnimationController(vsync: this);
    controller3 = AnimationController(vsync: this);
    controller4 = AnimationController(vsync: this);
    contentController1 = AnimationController(vsync: this);
    contentController2 = AnimationController(vsync: this);
    contentController3 = AnimationController(vsync: this);
    contentController4 = AnimationController(vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/logo-white.png'),
                const SizedBox(
                  width: 400,
                ),
                TextButton(
                  onPressed: () {
                    pageController.animateToPage(0,
                        duration: defaultDuration, curve: Curves.easeIn);
                  },
                  child: Text(
                    'Home',
                    style: headerStyle,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      pageController.animateToPage(2,
                          duration: smallDuration, curve: Curves.easeIn);
                    },
                    child: Text(
                      'About Us',
                      style: headerStyle,
                    )),
                TextButton(
                    onPressed: () {
                      pageController.animateToPage(3,
                          duration: smallDuration, curve: Curves.easeIn);
                    },
                    child: Text(
                      'Testimonials',
                      style: headerStyle,
                    )),
                TextButton(
                    onPressed: () {
                      pageController.animateToPage(5,
                          duration: smallDuration, curve: Curves.easeIn);
                    },
                    child: Text(
                      'Contact Us',
                      style: headerStyle,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(
                    'assets/rec.gif',
                    fit: BoxFit.fill,
                    width: 120,
                    height: 100,
                  ),
                ),
              ],
            ),
          )),
      body: ScrollConfiguration(
        behavior: const CupertinoScrollBehavior(),
        child: Stack(
          children: [
            Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Image.asset(
                  'assets/background.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 8000,
                );
              },
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: PageView(
                  dragStartBehavior: DragStartBehavior.down,
                  onPageChanged: (int index) {
                    switch (index) {
                      case 0:
                        if (currentIndex != 1) {
                          cancelAllAnimations();
                          controller1.animateTo(1,
                              duration: const Duration(milliseconds: 1500));
                        }

                        setState(() {
                          currentIndex = 0;
                        });

                      case 1:
                        if (currentIndex != 0) {
                          cancelAllAnimations();
                          controller1.animateTo(1,
                              duration: const Duration(milliseconds: 1500));
                        }
                        setState(() {
                          currentIndex = 1;
                        });
                      case 2:
                        setState(() {
                          currentIndex = 2;
                        });
                        cancelAllAnimations();
                        controller2.animateTo(1,
                            duration: const Duration(milliseconds: 1500));

                      case 3:
                        if (currentIndex != 4) {
                          cancelAllAnimations();
                          controller3.animateTo(1,
                              duration: const Duration(milliseconds: 1500));
                        }
                        setState(() {
                          currentIndex = 3;
                        });

                      case 4:
                        if (currentIndex != 3) {
                          cancelAllAnimations();
                          controller3.animateTo(1,
                              duration: const Duration(milliseconds: 1500));
                        }

                        setState(() {
                          currentIndex = 4;
                        });

                      case 5:
                        setState(() {
                          currentIndex = 5;
                        });

                        cancelAllAnimations();
                        controller4.animateTo(1,
                            duration: const Duration(milliseconds: 1500));
                      case 6:
                        setState(() {
                          currentIndex = 6;
                        });

                      case 7:
                        setState(() {
                          currentIndex = 7;
                        });
                    }
                  },
                  scrollDirection: Axis.vertical,
                  scrollBehavior: const CupertinoScrollBehavior(),
                  controller: pageController,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("pic1.jpg"), fit: BoxFit.fill)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 500, right: 50),
                        color: Colors.black.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Container(
                                  child: Text(
                                "Creative minds, collaborators, and visionaries\ncommitted to making content that is\nas unforgettable as it is beautiful.",
                                style: textBig,
                              )
                                      .animate(
                                          controller: contentController1,
                                          autoPlay: true,
                                          delay: const Duration(milliseconds: 1500))
                                      .fadeIn(begin: 0, duration: smallDuration)
                                      .moveX(
                                          end: 0,
                                          begin: 300,
                                          duration: smallDuration,
                                          curve: Curves.easeIn)),
                            ),
                            const Divider(
                              indent: 130,
                              endIndent: 130,
                              height: 3,
                              color: Colors.white,
                            ),
                            Text(
                              "We bring stories to life through bold visuals,\npowerful sound, and cinematic storytelling.\nWelcome to the creative engine behind\nyour next production.",
                              style: textBig,
                            )
                                .animate(
                                    controller: contentController2,
                                    autoPlay: true,
                                    delay: const Duration(milliseconds: 2200))
                                .fadeIn(begin: 0, duration: smallDuration)
                                .moveX(
                                    end: 0,
                                    begin: 300,
                                    duration: smallDuration,
                                    curve: Curves.easeIn)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 500, right: 50, top: 100),
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Beliefs:",
                            style: animatedStyle,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Multidisciplinary Team: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    " we specialize in crafting powerful audio-visual experiences that resonate. Whether it’s film, branded content, music videos, or podcasts, we bring storytelling to life through sound, motion, and emotion.",
                                style: textSmall)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Domain experts: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    "We’re not just content creators—we’re sound sculptors and visual architects. Our team exists to make things that feel as good as they look.",
                                style: textSmall)
                          ])),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 500, right: 50, top: 100),
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "Creative Direction & Concept Development: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    "From idea to execution. We help shape your story from the ground up.",
                                style: textSmall)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Video Production: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    "Commercials, interviews, music videos, short films, brand content. You name it.",
                                style: textSmall)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Audio Recording & Engineering: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    "High-fidelity sound capture for voiceovers, podcasts, music, and dialogue.",
                                style: textSmall)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Post-Production Editing: ",
                              style: textBig,
                            ),
                            TextSpan(
                                text:
                                    "Seamless cuts, transitions, sound mixing, and everything that brings your story to life.",
                                style: textSmall)
                          ])),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 500, right: 50, top: 100),
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Partners that trust us",
                              style: textBig,
                            ),
                            SizedBox(
                                width: 500,
                                height: 250,
                                child: CarouselSlider(
                                  items: [
                                    ColorFiltered(
                                        colorFilter: greyscale,
                                        child: Image.asset(
                                          "cactus.png",
                                        )),
                                    ColorFiltered(
                                        colorFilter: greyscale,
                                        child: Image.asset("ctama.png"))
                                  ],
                                  options: CarouselOptions(
                                    autoPlay: true,
                                  ),
                                ))
                          ]),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 500, right: 50, top: 100),
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Our Work",
                              style: textBig,
                            ),
                            SizedBox(
                                width: 800,
                                height: 250,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await sliderController.previousPage(
                                              duration: smallDuration);
                                        },
                                        icon: const Icon(
                                          Icons.chevron_left_outlined,
                                          size: 32,
                                        )),
                                    CarouselSlider(
                                      items: const [
                                        YouTubeEmbed(videoId: "YjVRT-OAqp4"),
                                        YouTubeEmbed(videoId: "RJ-jmf5JLbs"),
                                        YouTubeEmbed(videoId: "YjVRT-OAqp4"),
                                        YouTubeEmbed(videoId: "RJ-jmf5JLbs")
                                      ],
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        autoPlay: true,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await sliderController.nextPage();
                                        },
                                        icon: const Icon(
                                          Icons.chevron_right_outlined,
                                          size: 32,
                                        ))
                                  ],
                                )),
                            const SizedBox(
                              height: 200,
                            )
                          ]),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.2),
                      padding: const EdgeInsets.only(left: 500, top: 100, bottom: 90),
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Contact Us", style: textBig),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    labelText: "Name",
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? "Enter your name"
                                          : null,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your email";
                                    }
                                    final emailRegex =
                                        RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                    if (!emailRegex.hasMatch(value)) {
                                      return "Enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                    labelText: "Phone Number",
                                    prefixIcon: Icon(Icons.phone),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? "Enter your phone number"
                                          : null,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    labelText: "Message",
                                    alignLabelWithHint: true,
                                    prefixIcon: Icon(Icons.message),
                                  ),
                                  maxLines: 4,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? "Enter a message"
                                          : null,
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton.icon(
                                  onPressed: _submitForm,
                                  icon: const Icon(Icons.send),
                                  label: const Text("Submit"),
                                  style: ElevatedButton.styleFrom(
                                    iconColor: Colors.black,
                                    overlayColor: Colors.grey,
                                    surfaceTintColor: Colors.grey,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    textStyle: textSmall,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      color: Colors.black.withOpacity(0.2),
                      width: 400,
                      padding: const EdgeInsets.only(
                          left: 600, top: 240, bottom: 50, right: 100),
                      child:
                          const MapEmbed(latitude: 36.8415821, longitude: 10.2054574),
                    ),
                  ]),
            ),
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 3,
                          spreadRadius: 2)
                    ]),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: double.infinity,
                width: 450,
                child: DefaultTextStyle(
                  style: animatedStyle,
                  child: Stack(
                    children: [
                      Center(
                        child: const Text(
                          'Who We Are',
                        )
                            .animate(
                                controller: controller1,
                                delay: defaultDuration,
                                autoPlay: true)
                            .fadeIn(
                                curve: Curves.easeIn,
                                begin: 0,
                                duration: defaultDuration),
                      ),
                      Center(
                        child: const Text(
                          'What We Do',
                        )
                            .animate(controller: controller2, autoPlay: false)
                            .fadeIn(
                                curve: Curves.easeIn,
                                begin: 0,
                                duration: const Duration(milliseconds: 1500)),
                      ),
                      Center(
                        child: const Text(
                          'Where to find us',
                        )
                            .animate(controller: controller4, autoPlay: false)
                            .fadeIn(
                                curve: Curves.easeIn,
                                begin: 0,
                                duration: const Duration(milliseconds: 1500)),
                      ),
                      Center(
                        child: const Text(
                          'Testimonials',
                        )
                            .animate(controller: controller3, autoPlay: false)
                            .fadeIn(
                                curve: Curves.easeIn,
                                begin: 0,
                                duration: const Duration(milliseconds: 1500)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cancelAnimationsExcept(int index) {
    final map = {
      1: controller1,
      2: controller2,
      3: controller3,
      4: controller4
    };

    map.forEach((key, value) {
      if (key != index) {
        value.reset();
      }
    });
  }

  void cancelAllAnimations() {
    controller1.reset();
    controller2.reset();
    controller3.reset();
    controller4.reset();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // You can handle form data here

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );

      // Clear fields after submit (optional)
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      messageController.clear();
    }
  }
}
