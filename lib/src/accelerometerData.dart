import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

// ignore: camel_case_types
class accelerometerData extends StatefulWidget {
  @override
  _accelerometerData createState() => _accelerometerData();
}

// ignore: camel_case_types
class _accelerometerData extends State<accelerometerData> {
  double x, y, z;
  String text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    }); //get the sensor data and set then to the data types
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   child: Text("AccelerometerEvent (x: $x, y: $y, z: $z)"),
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
