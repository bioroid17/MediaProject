import 'package:batta/model/model_login.dart';
import 'package:batta/screen/screen_login.dart';
import 'package:batta/service/flutter_local_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return const MaterialApp(
      title: 'BATTA',
      home: LoginScreen(),
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
