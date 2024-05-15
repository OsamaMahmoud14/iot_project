// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:iot_project/firebase_options.dart';
// import 'package:iot_project/pages/Temperature.dart';
// import 'package:iot_project/pages/app_test.dart';
// import 'package:iot_project/pages/firebaseTest.dart';
// import 'package:iot_project/pages/insert_data.dart';
// import 'package:iot_project/pages/last_values.dart';
// import 'package:iot_project/pages/mqtt.dart';
// import 'package:iot_project/pages/mqtt2.dart';
// import 'package:iot_project/pages/subscriber.dart';
// import 'package:iot_project/pages/temp.dart';
//
// import 'pages/homePage.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//     // final mqttManager = MQTTManager(
//     //   server: '192.168.137.1',
//     //   topic: 'home/Fire',
//     //   clientIdentifier: 'flutter_client',
//     //   port: 1883,
//     //
//     // );
//
//     // Connect to MQTT broker and subscribe to the topic
//     // await mqttManager.connect();
//
//     // Disconnect when done
//     // mqttManager.disconnect();
//
//
//
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home:Subscriber()
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/firebase_options.dart';
import 'package:iot_project/pages/firebaseTest.dart';
import 'package:iot_project/pages/last_values.dart';
import 'package:iot_project/pages/mqtt2.dart';
import 'package:iot_project/pages/splash.dart';

import 'package:iot_project/pages/temp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


