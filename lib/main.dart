import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nukeviet/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}
