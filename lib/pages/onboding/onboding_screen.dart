import 'dart:ui';
import 'package:bookmarks/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../bookmark_page.dart';
import 'components/animated_btn.dart';
import 'package:bookmarks/theme/theme_provider.dart';
// import 'components/sign_in_dialog.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // Positioned(
          //   width: MediaQuery.of(context).size.width * 1.7,
          //   left: 100,
          //   bottom: 100,
          //   child: Image.asset(
          //     "assets/Backgrounds/Spline.png",
          //   ),
          // ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 280,
                      child: Column(children: [
                        const Text(
                          "Let's \nAdd Your Bookmark",
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            height: 1.2,
                            // color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "This is AI based Bookmark app for managing your Bookmarks at one place with power of AI.",
                          // style: TextStyle(color: Colors.grey[400]),
                        ),
                      ]),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookmarksPage(),
                          ),
                        );
                        // _btnAnimationController.isActive = true;

                        // Future.delayed(
                        //   const Duration(milliseconds: 800),
                        //   () {
                        //     setState(() {
                        //       isShowSignInDialog = true;
                        //     });
                        //     showCustomDialog(
                        //       context,
                        //       onValue: (_) {},
                        //     );
                        //     // showCustomDialog(
                        //     //   context,
                        //     //   onValue: (_) {
                        //     //     setState(() {
                        //     //       isShowSignInDialog = false;
                        //     //     });
                        //     //   },
                        //     // );
                        //   },
                        // );
                      },
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 24),
                    //   child: Text(
                    //       "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    // )
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
