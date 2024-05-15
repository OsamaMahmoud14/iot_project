import 'package:flutter/material.dart';
import 'package:iot_project/pages/Bazzar.dart';
import 'package:iot_project/pages/Heating.dart';
import 'package:iot_project/pages/fire_values.dart';
import 'package:iot_project/pages/subscriber.dart';
import 'package:iot_project/util/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Fire extends StatefulWidget {


  @override
  State<Fire> createState() => _FireState();
}

class _FireState extends State<Fire> {
  late MQTTManager mqttManager;
  String message = 'Waiting for message...';
  late String FireVal="26";

  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1', // Replace with your broker IP
      topic: 'home/Fire',
      clientIdentifier: 'Flutter',
    );
    connectToMQTT();
  }

  void connectToMQTT() async {
    mqttManager.connect();
  }

  @override
  void dispose() {
    mqttManager.disconnect();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: textColor,
                    ),
                  ),
                  Image.asset(
                    "assets/images/menu.png",
                    height: 30,
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      StreamBuilder<String>(
                        stream: mqttManager.messageStream,
                        builder: (context, snapshot){
                          if (snapshot.hasData) {
                            FireVal=snapshot.data!;
                            return CircularPercentIndicator(

                              radius: 110,
                              lineWidth: 20,
                              percent: 0.72,
                              backgroundColor: Color(0xFFEAE4FF),
                              progressColor: textColor,
                              center: Text(
                                FireVal,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    fontSize: 40),
                              ),
                            );

                          }
                          else {
                            return Text(
                              'Waiting for message...',
                              style: TextStyle(fontSize: 20),
                            );
                          }
                        },

                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Fire",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: textColor),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          generalServices(title: 'General',isActive: true),
                          generalServices(title: 'Services',isActive: false),

                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FireValues(
                        fireValue: double.parse(FireVal),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget generalServices({

    required String title,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: (){
        if (title == "General"){
        }
        else
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bazzar()));
        },


      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        decoration: BoxDecoration(
            color: isActive ? primary : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: primary)),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isActive ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
