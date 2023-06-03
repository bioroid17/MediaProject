import 'package:batta/model/model_login.dart';
import 'package:batta/screen/screen_login.dart';
import 'package:batta/service/flutter_local_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  // 로그인 정보 상태 관리를 위해 MultiProvider 사용
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => LoginModel(username: '')),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BATTA',
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/BATTA_icon.png'),
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 13, 32, 101),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FlutterLocalNotification.init();

    Future.delayed(const Duration(seconds: 3),
        FlutterLocalNotification.requestNotificationPermission());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => FlutterLocalNotification.showNotification(),
          child: const Text("알림 보내기"),
        ),
      ),
    );
  }
}
