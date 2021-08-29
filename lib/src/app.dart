



import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'include/language.dart';
import 'include/router.dart';

class MyApp extends StatelessWidget {
  // final messaging = FirebaseMessaging.instance;

  @override
  StatelessElement createElement() {
    // fireBaseCloudMessagingListeners();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: GetRouter.root,
      defaultTransition: Transition.native,
      translations: MultiLanguage(),
      locale: Locale('vi', 'VN'),
      debugShowCheckedModeBanner: false,
      getPages: GetRouter.getPages(),
    );
  }

///
// void fireBaseCloudMessagingListeners() async {
//   /// Update the iOS foreground notification presentation options to allow
//   /// heads up notifications.
//   await messaging.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//
//   logger.info('User granted permission: ${settings.authorizationStatus}');
//
//   String token = await messaging.getToken();
//   logger.info('token: $token');
//
//   Global.shared.deviceToken = token;
//
//   await messaging.subscribeToTopic('global');
// }
}
