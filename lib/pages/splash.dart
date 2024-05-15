import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_project/onBoarding/onBoarding.dart';
import 'package:lottie/lottie.dart';


class splash extends StatefulWidget {


  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), ()
    {
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnboardingScreen()));


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset("assets/images/Animation - 1701067352884.json"),


          ),

        ],
      ),

    );
  }
}


//assets/lottiefiles/Animation - 1701067277846.json == puzzle
//assets/lottiefiles/Animation - 1701067343191.json == clown
//assets/lottiefiles/Animation - 1701067383586.json == ball
//assets/lottiefiles/Animation - 1701067442585.json = logo
//assets/lottiefiles/Animation - 1701067457206.json = dog
//assets/lottiefiles/Animation - 1701067352884.json = girl
//assets/lottiefiles/Animation - 1701067435361.json = cat with vegetables
//assets/lottiefiles/Animation - 1701069330955.json = boy