// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC2OBMpxQMa3mn1rD3E5Yt3s2gU-5NQq6c',
    appId: '1:904852322209:web:7e08f954bd5741ea1ebde0',
    messagingSenderId: '904852322209',
    projectId: 'amazing-rally',
    authDomain: 'amazing-rally.firebaseapp.com',
    storageBucket: 'amazing-rally.firebasestorage.app',
    measurementId: 'G-Q9SGNNDJW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9IOETxbfvCKMoyaW3CHjc3tlgXVn9te8',
    appId: '1:904852322209:android:80ad873bf33a00341ebde0',
    messagingSenderId: '904852322209',
    projectId: 'amazing-rally',
    storageBucket: 'amazing-rally.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYpikLjjK7MRFtpm3xQqbgYuh1mBqYRO0',
    appId: '1:904852322209:ios:024df1ac8bc98cd91ebde0',
    messagingSenderId: '904852322209',
    projectId: 'amazing-rally',
    storageBucket: 'amazing-rally.firebasestorage.app',
    iosBundleId: 'com.example.badminton1',
  );
}
