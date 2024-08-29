import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load();
      await Firebase.initializeApp();
      runApp(await builder());
    },
    (error, stackTrace) => log(
      'runZonedGuarded: Caught error in my root zone.',
      error: error,
      stackTrace: stackTrace,
    ),
  );
}
