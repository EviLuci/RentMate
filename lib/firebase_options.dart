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
    apiKey: 'AIzaSyB3c-J9sirZwrOvpKWuUPws6jQVQSH_qXs',
    appId: '1:164050542309:web:87e7b1ac2a646eae4b7e0c',
    messagingSenderId: '164050542309',
    projectId: 'rentmate-9d97e',
    authDomain: 'rentmate-9d97e.firebaseapp.com',
    storageBucket: 'rentmate-9d97e.firebasestorage.app',
    measurementId: 'G-FG4MLXV81R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgsiM5jb5sN70S8t2aPAq8nlUZnuFCvRU',
    appId: '1:164050542309:android:686d56f70859152e4b7e0c',
    messagingSenderId: '164050542309',
    projectId: 'rentmate-9d97e',
    storageBucket: 'rentmate-9d97e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCi2ZCAdZfqWY0ryWBKnqCti_e6JgXZZ60',
    appId: '1:164050542309:ios:021e8fd4b21d92b64b7e0c',
    messagingSenderId: '164050542309',
    projectId: 'rentmate-9d97e',
    storageBucket: 'rentmate-9d97e.firebasestorage.app',
    iosBundleId: 'com.example.rentmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCi2ZCAdZfqWY0ryWBKnqCti_e6JgXZZ60',
    appId: '1:164050542309:ios:021e8fd4b21d92b64b7e0c',
    messagingSenderId: '164050542309',
    projectId: 'rentmate-9d97e',
    storageBucket: 'rentmate-9d97e.firebasestorage.app',
    iosBundleId: 'com.example.rentmate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB3c-J9sirZwrOvpKWuUPws6jQVQSH_qXs',
    appId: '1:164050542309:web:f66b6d3a3af849314b7e0c',
    messagingSenderId: '164050542309',
    projectId: 'rentmate-9d97e',
    authDomain: 'rentmate-9d97e.firebaseapp.com',
    storageBucket: 'rentmate-9d97e.firebasestorage.app',
    measurementId: 'G-KM6G5SLEN1',
  );

}