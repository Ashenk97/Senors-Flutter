import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sensors/screens/user.dart';
import 'package:flutter_sensors/screens/view.dart';

void main() {
  testWidgets('user page shows the start button', (tester) async {
    await tester.pumpWidget(MaterialApp(home: UserPage()));
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Flutter Sensors'), findsOneWidget);
  });

  testWidgets('sensor view shows the entered name', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SensorView(userName: 'Ada')),
    );
    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('Accelerometer Data'), findsOneWidget);
    expect(find.text('Gyroscope Data'), findsOneWidget);
  });
}
