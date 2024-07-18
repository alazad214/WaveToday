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
    apiKey: 'AIzaSyCp7mArmDkLs8EEJoKdnBCgKc7yguXYUPM',
    appId: '1:678241185049:web:891ea23ff1cde6a9d06988',
    messagingSenderId: '678241185049',
    projectId: 'wavetoday-news',
    authDomain: 'wavetoday-news.firebaseapp.com',
    storageBucket: 'wavetoday-news.appspot.com',
    measurementId: 'G-XV6TPX9SH2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyHah95cJyMU8si5_0uBLL83tHKwtJ7Yg',
    appId: '1:678241185049:android:2732b2cc32dc5424d06988',
    messagingSenderId: '678241185049',
    projectId: 'wavetoday-news',
    storageBucket: 'wavetoday-news.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcjX318fYKgsD5CnyFiKFpBMJ2KRdKFfo',
    appId: '1:678241185049:ios:b8cecbe9e2249731d06988',
    messagingSenderId: '678241185049',
    projectId: 'wavetoday-news',
    storageBucket: 'wavetoday-news.appspot.com',
    iosBundleId: 'com.example.wavetoday',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcjX318fYKgsD5CnyFiKFpBMJ2KRdKFfo',
    appId: '1:678241185049:ios:b8cecbe9e2249731d06988',
    messagingSenderId: '678241185049',
    projectId: 'wavetoday-news',
    storageBucket: 'wavetoday-news.appspot.com',
    iosBundleId: 'com.example.wavetoday',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCp7mArmDkLs8EEJoKdnBCgKc7yguXYUPM',
    appId: '1:678241185049:web:6af0b7dc8699a91ed06988',
    messagingSenderId: '678241185049',
    projectId: 'wavetoday-news',
    authDomain: 'wavetoday-news.firebaseapp.com',
    storageBucket: 'wavetoday-news.appspot.com',
    measurementId: 'G-4YWSDT0VC5',
  );
}
