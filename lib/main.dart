import 'firebase_options.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:final_project/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  DevicePreview(
    enabled: false,
    builder: (context) {
      return TripEase();
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(TripEase());
}
