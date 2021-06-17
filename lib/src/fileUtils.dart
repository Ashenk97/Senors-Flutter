import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CounterStorage {
  final AccelerometerEvent x;
  final AccelerometerEvent y;
  final AccelerometerEvent z;

  CounterStorage(this.x, this.y, this.z);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String userName) async {
    final path = await _localPath;
    return File(
        "$path/" + userName + "_" + (DateTime.now().toString()) + ".txt");
  }

  Future<File> writeCounter(String userName) async {
    final file = await _localFile(userName);
    final text =
        ("AccelerometerEvent (x: $x.toStringAsFixed(2), y: $y.toStringAsFixed(2), z: $z.toStringAsFixed(2))");
    return file.writeAsString(text);
  }
}
