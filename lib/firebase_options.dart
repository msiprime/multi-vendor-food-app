import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get web => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_WEB']!,
        appId: dotenv.env['FIREBASE_APP_ID_WEB']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_WEB']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_WEB']!,
        authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_WEB']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_WEB']!,
      );

  static FirebaseOptions get android => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID']!,
        appId: dotenv.env['FIREBASE_APP_ID_ANDROID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_ANDROID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_ANDROID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_ANDROID']!,
      );

  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_IOS']!,
        appId: dotenv.env['FIREBASE_APP_ID_IOS']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_IOS']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_IOS']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_IOS']!,
        iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
      );

  static FirebaseOptions get macos => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_MACOS']!,
        appId: dotenv.env['FIREBASE_APP_ID_MACOS']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_MACOS']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_MACOS']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_MACOS']!,
        iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID_MACOS']!,
      );

  static FirebaseOptions get windows => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY_WINDOWS']!,
        appId: dotenv.env['FIREBASE_APP_ID_WINDOWS']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_WINDOWS']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID_WINDOWS']!,
        authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_WINDOWS']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_WINDOWS']!,
      );
}
