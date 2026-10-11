import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

// ignore: camel_case_types
class gyroscopeData extends StatefulWidget {
  @override
  _gyroscopeData createState() => _gyroscopeData();
}

// ignore: camel_case_types
class _gyroscopeData extends State<gyroscopeData> {
  double x = 0, y = 0, z = 0;
  StreamSubscription<GyroscopeEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      if (!mounted) return;
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   child: Text("GyroscopeEvent (x: $x, y: $y, z: $z)"),
          // ),
          Table(
            border: TableBorder.all(
              width: 2.0,
              color: Colors.pink,
              style: BorderStyle.solid,
            ),
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "X Axis : ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(x.toStringAsFixed(2),
                        //trim the axis value to 2 digit after decimal point
                        style: TextStyle(fontSize: 20.0)),
                  )
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Y Axis : ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(y.toStringAsFixed(2),
                        //trim the axis value to 2 digit after decimal point
                        style: TextStyle(fontSize: 20.0)),
                  )
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Z Axis : ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(z.toStringAsFixed(2),
                        //trim the axis value to 2 digit after decimal point
                        style: TextStyle(fontSize: 20.0)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
