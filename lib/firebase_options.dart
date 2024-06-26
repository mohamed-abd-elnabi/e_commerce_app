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
    apiKey: 'AIzaSyAu8BA_uzAzY5IwOBjTA0DtUlC8DiN0hy4',
    appId: '1:148332529494:web:068e0e7b2b9cfefae378f7',
    messagingSenderId: '148332529494',
    projectId: 'shop-avatar',
    authDomain: 'shop-avatar.firebaseapp.com',
    storageBucket: 'shop-avatar.appspot.com',
    measurementId: 'G-GXXTHWLD0W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPPlNWdwy9j4D2phU7W9ICKfijQHFQsHo',
    appId: '1:148332529494:android:8c4aaabe323ccbd3e378f7',
    messagingSenderId: '148332529494',
    projectId: 'shop-avatar',
    storageBucket: 'shop-avatar.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLXXxRbNR78tdWDR6663vp46979tgKaxY',
    appId: '1:148332529494:ios:2b34a93182460417e378f7',
    messagingSenderId: '148332529494',
    projectId: 'shop-avatar',
    storageBucket: 'shop-avatar.appspot.com',
    iosBundleId: 'shop.avatar.shopAvatar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLXXxRbNR78tdWDR6663vp46979tgKaxY',
    appId: '1:148332529494:ios:b4432e20a309b263e378f7',
    messagingSenderId: '148332529494',
    projectId: 'shop-avatar',
    storageBucket: 'shop-avatar.appspot.com',
    iosBundleId: 'shop.avatar.shopAvatar.RunnerTests',
  );
}
