import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loggy/loggy.dart';
import 'package:payaki/integration/firebase_integration.dart';
import 'package:payaki/integration/local_notification_integration.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/splash/splash_screen.dart';
import 'package:payaki/routes/app_routes.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();
  Loggy.initLoggy();
  await FirebaseIntegration().setFCM();
  await LocalNotificationIntegration().initialiseLocalNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        // splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'PAYAKI',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            // home: const LogInScreen(),
            onGenerateRoute: AppRoute.generateRoute,
            // home: Preference().getUserLogin() == false
            //     ? const WelcomeScreen()
            //     : const BottomNavigationBarScreen(),
            home: const SplashScreen(),
          );
        });
  }
}
