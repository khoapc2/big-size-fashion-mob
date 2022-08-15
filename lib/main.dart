import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/locator.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/waiting_home/splash_screen.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/token.dart';
import 'package:shop_app/view_model/login_view_model.dart';

import 'models/customer_account/login_response_model.dart';

StorageService _storageService = StorageService();
class MyHttpOverrides extends HttpOverrides {
  
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  final storage = const FlutterSecureStorage();

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.data}");
}
Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //permission for IOS/Web
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  //When the app is in the background and opened directly from the push notification.
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  
  setup();
  var routeName = await naviagateToFirstScreen();

  runApp(MyApp(routeName));
}

Future<String> naviagateToFirstScreen() async {
    print("Có chạy vào hàm naviagateToFirstScreen");
    var token = await getUserToken();
    if(token == null){
      return SplashScreen.routeName;
    }
    else{
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return HomeScreen.routeName;
    }
  }



class MyApp extends StatelessWidget {
  
  late String token;
  String? routeName;
  MyApp(this.routeName);




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    //return 
    // FutureBuilder(
    //   future: routeString,
    //   builder: (BuildContext context, AsyncSnapshot<String> snapshot){
    //     print("Bạn đang ở hàm build nè và xem nó chạy lại mấy lần");
    //     print("route:"+snapshot.data.toString());
    //     if(snapshot.data == null){
    //        return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: theme(),
      
    //   // home: SplashScreen(),
    //   // We use routeName so that we dont need to remember the name

    //   initialRoute: WaitngHomeScreen.routeName,
    //   routes: routes,
    // );
    //       // Navigator.push(
    //       //               context,
    //       //             MaterialPageRoute(builder: (context) => WaitngHomeScreen()),
    //       //           );
    // // return WaitngHomeScreen();
    //     }

    //     Navigator.pushNamed(context, HomeScreen.routeName);
    //     return Container();
        
    // //    return MaterialApp(
    // //   debugShowCheckedModeBanner: false,
    // //   title: 'Flutter Demo',
    // //   theme: theme(),
      
    // //   // home: SplashScreen(),
    // //   // We use routeName so that we dont need to remember the name
    // //   initialRoute: HomeScreen.routeName,
    // //   routes: routes,
    // // );
    // });
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: routeName,
      routes: routes,
    );

  }

  
}


