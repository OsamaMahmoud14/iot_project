import 'package:flutter/material.dart';
import 'package:iot_project/pages/services.dart';

import '../util/app_colors.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 5,left: 25,right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor
                      ),
                    ),
                    Image.asset(
                      "assets/images/menu.png",
                      height: 22,

                    ),

                  ],
                ),
                Expanded(
                    child:ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Image.asset(
                          "assets/images/smart home.png"
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Smart Home",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: textColor
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "SERVICES",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textColor
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Services()
                      ],
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
}
