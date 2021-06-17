import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_sensors/src/accelerometerData.dart';
import 'package:flutter_sensors/src/gyroscopeData.dart';

class View extends StatelessWidget {
  final String userName;
  final AccelerometerEvent x;
  final AccelerometerEvent y;
  final AccelerometerEvent z;

  View({Key key, @required this.userName, this.x, this.y, this.z})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Gyroscope & Accelerometer'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Accelerometer Data',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 150,
                        child: accelerometerData(),
                      ),
                      Text(
                        'Gyroscope Data',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 150,
                        child: gyroscopeData(),
                      ),
                      SizedBox(height: 5),
                      // ElevatedButton(
                      //   child: Text('Stop'),
                      //   onPressed: () async {
                      //     CounterStorage cs = new CounterStorage(x, y, z);
                      //     File fileX = await cs.writeCounter(userName);
                      //
                      //     if (fileX == null) {
                      //       print("No file created");
                      //     } else {
                      //       print("File created");
                      //     }
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.pink,
                      //     padding:
                      //     EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                      //     textStyle: TextStyle(
                      //         fontSize: 20, fontWeight: FontWeight.bold),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
