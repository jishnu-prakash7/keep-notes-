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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDGU4Rd-eu4lIBkKWkxx8HZIcASB1aDRDg',
    appId: '1:991948113441:web:8f31a5308cc22d454c8560',
    messagingSenderId: '991948113441',
    projectId: 'new-note-app-3d764',
    authDomain: 'new-note-app-3d764.firebaseapp.com',
    storageBucket: 'new-note-app-3d764.appspot.com',
    measurementId: 'G-Y8FKRJ8JP9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUBCMRrHznPn1Jy7bt3FPTLdAmxh3IwLY',
    appId: '1:991948113441:android:3a6667c192d69b504c8560',
    messagingSenderId: '991948113441',
    projectId: 'new-note-app-3d764',
    storageBucket: 'new-note-app-3d764.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHlBChPe00_Zd4I-VGkHS2HH39wb2GvKs',
    appId: '1:991948113441:ios:b7088cb4bf01488f4c8560',
    messagingSenderId: '991948113441',
    projectId: 'new-note-app-3d764',
    storageBucket: 'new-note-app-3d764.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHlBChPe00_Zd4I-VGkHS2HH39wb2GvKs',
    appId: '1:991948113441:ios:b7088cb4bf01488f4c8560',
    messagingSenderId: '991948113441',
    projectId: 'new-note-app-3d764',
    storageBucket: 'new-note-app-3d764.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGU4Rd-eu4lIBkKWkxx8HZIcASB1aDRDg',
    appId: '1:991948113441:web:6270ca08d48270544c8560',
    messagingSenderId: '991948113441',
    projectId: 'new-note-app-3d764',
    authDomain: 'new-note-app-3d764.firebaseapp.com',
    storageBucket: 'new-note-app-3d764.appspot.com',
    measurementId: 'G-L8K8HHFLC9',
  );
}
