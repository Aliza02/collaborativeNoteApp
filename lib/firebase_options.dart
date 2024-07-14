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
    apiKey: 'AIzaSyBq1mr8xhxuUrIf0AVB4yyCWP_tSRaklmg',
    appId: '1:655737735424:web:6d7523f70416d451288be5',
    messagingSenderId: '655737735424',
    projectId: 'notesapp-d8033',
    authDomain: 'notesapp-d8033.firebaseapp.com',
    storageBucket: 'notesapp-d8033.appspot.com',
    measurementId: 'G-5X8D29PFV5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAS_RxX2VzRumE-4iliQvjPWc71QzFuEs8',
    appId: '1:655737735424:android:59c41eff3c92f455288be5',
    messagingSenderId: '655737735424',
    projectId: 'notesapp-d8033',
    storageBucket: 'notesapp-d8033.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPy5yxdQVQbTc22ndn6KUiA8sDW3-nMrs',
    appId: '1:655737735424:ios:a877a9ef2b1648c0288be5',
    messagingSenderId: '655737735424',
    projectId: 'notesapp-d8033',
    storageBucket: 'notesapp-d8033.appspot.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPy5yxdQVQbTc22ndn6KUiA8sDW3-nMrs',
    appId: '1:655737735424:ios:a877a9ef2b1648c0288be5',
    messagingSenderId: '655737735424',
    projectId: 'notesapp-d8033',
    storageBucket: 'notesapp-d8033.appspot.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBq1mr8xhxuUrIf0AVB4yyCWP_tSRaklmg',
    appId: '1:655737735424:web:9323fe01869eaf61288be5',
    messagingSenderId: '655737735424',
    projectId: 'notesapp-d8033',
    authDomain: 'notesapp-d8033.firebaseapp.com',
    storageBucket: 'notesapp-d8033.appspot.com',
    measurementId: 'G-KSFLGV4JGQ',
  );
}
