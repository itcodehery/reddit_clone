import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCZfqPdgJUIFD-nTKdm-hkrCTuhcCWvqiI',
    appId: '1:58222097201:web:b9f33b5944f76d51713610',
    messagingSenderId: '58222097201',
    projectId: 'reddit-clone-ae477',
    authDomain: 'reddit-clone-ae477.firebaseapp.com',
    storageBucket: 'reddit-clone-ae477.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvGrE_UWkVZEKMppbMZuBJ_rJiTjL57kc',
    appId: '1:58222097201:android:4f72e32444306d3c713610',
    messagingSenderId: '58222097201',
    projectId: 'reddit-clone-ae477',
    storageBucket: 'reddit-clone-ae477.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_PU3HnGEupSJ99SOoaHtW-VA3JGWjWuQ',
    appId: '1:58222097201:ios:c13c6d144cfa955d713610',
    messagingSenderId: '58222097201',
    projectId: 'reddit-clone-ae477',
    storageBucket: 'reddit-clone-ae477.appspot.com',
    iosBundleId: 'com.example.redditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_PU3HnGEupSJ99SOoaHtW-VA3JGWjWuQ',
    appId: '1:58222097201:ios:c13c6d144cfa955d713610',
    messagingSenderId: '58222097201',
    projectId: 'reddit-clone-ae477',
    storageBucket: 'reddit-clone-ae477.appspot.com',
    iosBundleId: 'com.example.redditClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZfqPdgJUIFD-nTKdm-hkrCTuhcCWvqiI',
    appId: '1:58222097201:web:72cce7e443025ed5713610',
    messagingSenderId: '58222097201',
    projectId: 'reddit-clone-ae477',
    authDomain: 'reddit-clone-ae477.firebaseapp.com',
    storageBucket: 'reddit-clone-ae477.appspot.com',
  );
}
