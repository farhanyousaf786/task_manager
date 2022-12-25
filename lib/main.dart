import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'widgets/add_task_screen.dart';
import 'widgets/app_info_screen.dart';
import 'widgets/instructions_screen.dart';
import 'package:todoapp/screens/settings_screen.dart';
import 'widgets/bottom_bar.dart';

import 'models/bottom_bar/fab_bottom_app_bar.dart';
import 'models/bottom_bar/fab_with_icons.dart';
import 'models/bottom_bar/layout.dart';
import 'models/task_data.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider<TaskData>(

    create: (_) => TaskData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<TaskData>(context).currTheme,
      title: 'ToDo Task Reminder',
      home: BottomBar(),
      routes: {
        BottomBar.id: (context) => BottomBar(),
        AddTaskScreen.id: (context) => AddTaskScreen(),
        AppInfoScreen.id: (context) => AppInfoScreen(),
        // InstructionsScreen.id: (context) => InstructionsScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
//flutter build appbundle --target-platform android-arm,android-arm64
//flutter build apk --target-platform=android-arm
//flutter build apk --target-platform=android-arm64
//flutter build appbundle --release