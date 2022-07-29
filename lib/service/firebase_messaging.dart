import 'package:firebase_messaging/firebase_messaging.dart';

class HandleMessagingFirebase {
  static Future<void> receiveMessagingFromServer(String username) async {
    await FirebaseMessaging.instance.subscribeToTopic(username);
    print('subscribeToTopic ' + username);
  }
}
