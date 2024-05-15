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
    apiKey: 'AIzaSyD7YtCigpUhlO6EdgnpnM5dwAE00bo0ENA',
    appId: '1:175094610734:web:16b0636e6cf30ee27b18bf',
    messagingSenderId: '175094610734',
    projectId: 'smarthome-8f996',
    authDomain: 'smarthome-8f996.firebaseapp.com',
    databaseURL: 'https://smarthome-8f996-default-rtdb.firebaseio.com',
    storageBucket: 'smarthome-8f996.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdeD_YKhINJ3t67-PUVBo2xMwQZoe5d10',
    appId: '1:175094610734:android:80ed329bf16bc7ed7b18bf',
    messagingSenderId: '175094610734',
    projectId: 'smarthome-8f996',
    databaseURL: 'https://smarthome-8f996-default-rtdb.firebaseio.com',
    storageBucket: 'smarthome-8f996.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMId7w166gb9AYblWgZMIhFgOEJz9qvgE',
    appId: '1:175094610734:ios:77d9529281896c947b18bf',
    messagingSenderId: '175094610734',
    projectId: 'smarthome-8f996',
    databaseURL: 'https://smarthome-8f996-default-rtdb.firebaseio.com',
    storageBucket: 'smarthome-8f996.appspot.com',
    iosBundleId: 'com.example.iotProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMId7w166gb9AYblWgZMIhFgOEJz9qvgE',
    appId: '1:175094610734:ios:77d9529281896c947b18bf',
    messagingSenderId: '175094610734',
    projectId: 'smarthome-8f996',
    databaseURL: 'https://smarthome-8f996-default-rtdb.firebaseio.com',
    storageBucket: 'smarthome-8f996.appspot.com',
    iosBundleId: 'com.example.iotProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7YtCigpUhlO6EdgnpnM5dwAE00bo0ENA',
    appId: '1:175094610734:web:983cc47c15b1d0e27b18bf',
    messagingSenderId: '175094610734',
    projectId: 'smarthome-8f996',
    authDomain: 'smarthome-8f996.firebaseapp.com',
    databaseURL: 'https://smarthome-8f996-default-rtdb.firebaseio.com',
    storageBucket: 'smarthome-8f996.appspot.com',
  );
}
