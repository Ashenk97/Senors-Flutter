import 'package:flutter/material.dart';
import 'package:flutter_sensors/screens/view.dart';

class UserPage extends StatefulWidget {
  _UserPageState createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Flutter Sensors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter User name'),
                controller: userController,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('Start'),
              onPressed: () {
                _sendDataToSecondScreen(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String userName = userController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              View(
                userName: userName,
              ),
        ));
  }
}
