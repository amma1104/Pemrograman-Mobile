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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBUS0_3hahuHoWPg1NzBntNLYp0td3p8Ro',
    appId: '1:1081793901037:web:8ff21b9b8978fce88a77e4',
    messagingSenderId: '1081793901037',
    projectId: 'prakmodul3-9f567',
    authDomain: 'prakmodul3-9f567.firebaseapp.com',
    storageBucket: 'prakmodul3-9f567.firebasestorage.app',
    measurementId: 'G-ZR6XCS37QE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqsigFcql-iQ_LUBkfVvUmwok8if-_-Og',
    appId: '1:1081793901037:android:14642f1bac9ac5738a77e4',
    messagingSenderId: '1081793901037',
    projectId: 'prakmodul3-9f567',
    storageBucket: 'prakmodul3-9f567.firebasestorage.app',
  );
}
