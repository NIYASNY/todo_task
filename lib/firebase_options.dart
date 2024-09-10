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
    apiKey: 'AIzaSyCv3GvMGqXXTu8XWt0MwEEtPLqEtPvUpqU',
    appId: '1:256151884681:web:0c881de3c06a19e15a4758',
    messagingSenderId: '256151884681',
    projectId: 'todo-task-ba720',
    authDomain: 'todo-task-ba720.firebaseapp.com',
    storageBucket: 'todo-task-ba720.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQKYaEwmYGzNK6ig0rhDGmBhpegLXnHyo',
    appId: '1:256151884681:android:c5181a9da46fd4fc5a4758',
    messagingSenderId: '256151884681',
    projectId: 'todo-task-ba720',
    storageBucket: 'todo-task-ba720.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDru5KR7T6AiChJ6ST67mgUHig5_xhPjI0',
    appId: '1:256151884681:ios:79be8afa0028db8a5a4758',
    messagingSenderId: '256151884681',
    projectId: 'todo-task-ba720',
    storageBucket: 'todo-task-ba720.appspot.com',
    iosBundleId: 'com.example.todoTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDru5KR7T6AiChJ6ST67mgUHig5_xhPjI0',
    appId: '1:256151884681:ios:79be8afa0028db8a5a4758',
    messagingSenderId: '256151884681',
    projectId: 'todo-task-ba720',
    storageBucket: 'todo-task-ba720.appspot.com',
    iosBundleId: 'com.example.todoTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCv3GvMGqXXTu8XWt0MwEEtPLqEtPvUpqU',
    appId: '1:256151884681:web:7430a230425c45445a4758',
    messagingSenderId: '256151884681',
    projectId: 'todo-task-ba720',
    authDomain: 'todo-task-ba720.firebaseapp.com',
    storageBucket: 'todo-task-ba720.appspot.com',
  );
}
