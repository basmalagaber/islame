import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'cache.dart';
import 'home_page.dart';

class OnboardScreen extends StatelessWidget {
  static const String routeName="/onboard";
   OnboardScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,
      color: Color(0xffE2BE7F)),
      bodyTextStyle: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xffE2BE7F)),
      pageColor: Color(0xff202020),
      imagePadding: EdgeInsets.zero,
      imageFlex: 3
    );
    return IntroductionScreen(
          globalHeader: Container(
            padding: EdgeInsets.only(bottom: size.height*6),
            child: Image.asset("assets/images/pic9.png",
              width: size.width*.5,
              height: size.height*0.3,
            fit: BoxFit.fill,),),

          dotsFlex: 4,
          dotsDecorator: DotsDecorator(
            color: Color(0xff707070),
            activeColor: Color(0xffE2BE7F)
          ),
          globalBackgroundColor:  Color(0xff202020),
          onDone: (){
            Cache.saveEligibility();
            Navigator.pushReplacementNamed((context), HomePage.routeName);
          },
          showDoneButton: true,
          done: Text("Finish",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
              color: Color(0xffE2BE7F)),),
          showNextButton: true,
          next: Text("Next",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
              color: Color(0xffE2BE7F)),),
          showBackButton: true,
          back: Text("Back",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
              color: Color(0xffE2BE7F)),),
          pages: [
            PageViewModel(
              title: "Welcome To Islmi App",
              body: "",
              image: _buildImage('Frame1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Welcome To Islami",
              body: "We Are Very Excited To Have You In Our Community",
              image: _buildImage('Frame2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Reading the Quran",
              body: "Read, and your Lord is the Most Generous",
              image: _buildImage('Frame3.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Bearish",
              body: "Praise the name of your Lord, the Most High",
              image: _buildImage('Frame4.png'),
              decoration: pageDecoration,
            ),PageViewModel(
              title: "Holy Quran Radio",
              body: "You can listen to the Holy Quran Radio through the application for free and easily",
              image: _buildImage('Frame5.png'),
              decoration: pageDecoration,
            ),
           ],
    );
  }
}

