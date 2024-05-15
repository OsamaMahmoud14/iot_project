import 'package:flutter/material.dart';
import 'package:iot_project/pages/subscriber.dart';

class Subscriber extends StatefulWidget {
  @override
  _SubscriberState createState() => _SubscriberState();
}

class _SubscriberState extends State<Subscriber> {
  late MQTTManager mqttManager;
  String message = 'Waiting for message...';

  @override
  void initState() {
    super.initState();
    mqttManager = MQTTManager(
      server: '192.168.137.1', // Replace with your broker IP
      topic: 'home/photoresistor',
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
      appBar: AppBar(
        title: Text('MQTT Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Message:',
            ),
            SizedBox(height: 20),
            StreamBuilder<String>(
              stream: mqttManager.messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(fontSize: 20),
                  );
                } else {
                  return Text(
                    'Waiting for message...',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}