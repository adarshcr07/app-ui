// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyAFtjIBwONksDVtZrICg5X84kA_u9QLOr4',
    appId: '1:550470716343:web:d0a47c8acecbd0518e7632',
    messagingSenderId: '550470716343',
    projectId: 'for-ui-app',
    authDomain: 'for-ui-app.firebaseapp.com',
    storageBucket: 'for-ui-app.appspot.com',
    measurementId: 'G-CFCXRN99WX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTCtR6mWIrCNU1g8zsp9dTsadRB15yFWw',
    appId: '1:550470716343:android:d0ba7684550388a68e7632',
    messagingSenderId: '550470716343',
    projectId: 'for-ui-app',
    storageBucket: 'for-ui-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsw6NyfgDPoDoj8STTGcs5IA-kEgDfSBA',
    appId: '1:550470716343:ios:5b4683017319814a8e7632',
    messagingSenderId: '550470716343',
    projectId: 'for-ui-app',
    storageBucket: 'for-ui-app.appspot.com',
    iosClientId: '550470716343-uhrh96e9olnckipffpagqqak91h62d6j.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstAppUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsw6NyfgDPoDoj8STTGcs5IA-kEgDfSBA',
    appId: '1:550470716343:ios:c6efd99f79494cc68e7632',
    messagingSenderId: '550470716343',
    projectId: 'for-ui-app',
    storageBucket: 'for-ui-app.appspot.com',
    iosClientId: '550470716343-uram670tsa75jkspf102769mdrukkagh.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstAppUi.RunnerTests',
  );
}