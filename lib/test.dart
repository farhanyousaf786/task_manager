// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:todoapp/models/task_data.dart';
// // // import 'package:todoapp/screens/settings_screen.dart';
// // // import 'package:todoapp/widgets/TaskList_WithoutReminder.dart' hide localStorage;
// // // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // // import 'add_task_screen.dart';
// // // import 'app_info_screen.dart';
// // // import 'instructions_screen.dart';
// // //
// // // class TasksScreen extends StatelessWidget {
// // //   static String id = 'tasksScreen';
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       // drawer: Drawer(
// // //       //   child: SafeArea(
// // //       //     child: ListView(
// // //       //       padding: EdgeInsets.only(top: 40.0),
// // //       //       children: <Widget>[
// // //       //         ListTile(
// // //       //           leading: Icon(Icons.info),
// // //       //           title: Text('About'),
// // //       //           onTap: () {
// // //       //             Navigator.pushNamed(context, AppInfoScreen.id);
// // //       //           },
// // //       //         ),
// // //       //         ListTile(
// // //       //             leading: Icon(FontAwesomeIcons.tasks),
// // //       //             title: Text('How to use'),
// // //       //             onTap: () {
// // //       //               Navigator.pushNamed(context, InstructionsScreen.id);
// // //       //             }),
// // //       //         ListTile(
// // //       //           leading: Icon(Icons.settings),
// // //       //           title: Text('Settings'),
// // //       //           onTap: () {
// // //       //             Navigator.pushNamed(context, SettingsScreen.id);
// // //       //           },
// // //       //         )
// // //       //       ],
// // //       //     ),
// // //       //   ),
// // //       // ),
// // //       backgroundColor: Colors.white,
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           showModalBottomSheet(
// // //             isScrollControlled: true,
// // //             context: context,
// // //             builder: (context) => SingleChildScrollView(
// // //               child: Container(
// // //                 padding: EdgeInsets.only(
// // //                     bottom: MediaQuery.of(context).viewInsets.bottom),
// // //                 child: AddTaskScreen(),
// // //               ),
// // //             ),
// // //           );
// // //         },
// // //         backgroundColor: Colors.lightBlue,
// // //         child: Icon(
// // //           Icons.add,
// // //           color: Colors.white,
// // //         ),
// // //       ),
// // //       body: FutureBuilder(
// // //         future: localStorage.ready,
// // //         builder: (context, snapshot) {
// // //           if (!snapshot.hasData) {
// // //             return Center(
// // //               child: CircularProgressIndicator(),
// // //             );
// // //           } else {
// // //             return Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: <Widget>[
// // //                 Container(
// // //                   height: MediaQuery.of(context).size.height / 5,
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.lightBlue,
// // //                     borderRadius: BorderRadius.only(
// // //                       bottomLeft: Radius.circular(30.0),
// // //                       bottomRight: Radius.circular(30.0),
// // //                     ),
// // //                   ),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: <Widget>[
// // //                       SizedBox(
// // //                         height: 50,
// // //                       ),
// // //                       // GestureDetector(
// // //                       //   onTap: Scaffold.of(context).openDrawer,
// // //                       //   child: CircleAvatar(
// // //                       //     backgroundColor: Colors.white,
// // //                       //     child: Icon(
// // //                       //       Icons.list,
// // //                       //       size: 30.0,
// // //                       //       color: Colors.lightBlueAccent,
// // //                       //     ),
// // //                       //     radius: 30.0,
// // //                       //   ),
// // //                       // ),
// // //
// // //                       Row(
// // //                         mainAxisAlignment: MainAxisAlignment.center,
// // //                         children: [
// // //                           Text(
// // //                             'Task Reminder',
// // //                             style: TextStyle(
// // //                               color: Colors.white,
// // //                               fontSize: 30.0,
// // //                               fontWeight: FontWeight.w700,
// // //                             ),
// // //                           ),
// // //                           SizedBox(
// // //                             width: 20,
// // //                           ),
// // //                           GestureDetector(
// // //                               onTap: () {
// // //                                 Navigator.pushNamed(context, SettingsScreen.id);
// // //                               },
// // //                               child: Icon(
// // //                                 Icons.settings,
// // //                                 color: Colors.white,
// // //                               ))
// // //                         ],
// // //                       ),
// // //                       SizedBox(
// // //                         height: MediaQuery.of(context).size.height / 30,
// // //                       ),
// // //                       Row(
// // //                         mainAxisAlignment: MainAxisAlignment.center,
// // //                         children: [
// // //                           Text(
// // //                             'Remaining tasks: ',
// // //                             style: TextStyle(
// // //                               color: Colors.white,
// // //                               fontSize: 15.0,
// // //                             ),
// // //                           ),
// // //                           Text(
// // //                             '${Provider.of<TaskData>(context).tasks.length}',
// // //                             style: TextStyle(
// // //                               color: Colors.white,
// // //                               fontSize: 16.0,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: Container(
// // //                     padding: EdgeInsets.symmetric(horizontal: 20.0),
// // //                     child: TasksList(),
// // //                   ),
// // //                 ),
// // //               ],
// // //             );
// // //           }
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // // ///
// // // ///
// // // ///
// // // ///
// // //
// //
// // ///
// // ///
// // ///
// //
// // import 'package:flutter/material.dart';
// // import 'package:localstorage/localstorage.dart';
// // import 'package:provider/provider.dart';
// // import 'package:todoapp/models/task.dart';
// // import 'package:todoapp/models/task_data.dart';
// // import 'package:todoapp/widgets/TaskListReminder.dart';
// // import 'package:todoapp/widgets/TileWithoutReminder.dart';
// //
// // final LocalStorage localStorage = LocalStorage('toDoList.json');
// //
// // bool initialised = false;
// // List tasksList = [];
// // String theme;
// //
// // class TaskReminderList extends StatefulWidget {
// //   @override
// //   _TaskReminderListState createState() => _TaskReminderListState();
// // }
// //
// // class _TaskReminderListState extends State<TaskReminderList> {
// //   Future<bool> get getData async {
// //     await localStorage.ready;
// //
// //     if (localStorage != null) {
// //       theme = await localStorage.getItem('theme');
// //
// //       tasksList = await localStorage.getItem('todos');
// //       print(theme);
// //       print("task list: $tasksList");
// //       if (tasksList == null) {
// //         tasksList = [
// //           Task(
// //               title: 'This Is A Task, Hold to view details.',
// //               isRemindMe: false),
// //           Task(
// //               title: 'Click the + button, to add a new task',
// //               isRemindMe: false),
// //           Task(title: 'Check the task, to mark it complete', isRemindMe: false),
// //           Task(
// //               title: 'Swipe in any direction to delete the task.',
// //               isRemindMe: false),
// //         ].map((e) => e.toJson()).toList();
// //       }
// //     }
// //
// //     return true;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder(
// //       future: getData,
// //       builder: (context, snapshot) {
// //         print("snapshot: >>>> ${snapshot.data}");
// //         if (!snapshot.hasData) {
// //           return Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         } else {
// //           return Consumer<TaskData>(
// //             builder: (context, taskData, child) {
// //               if (!initialised) {
// //                 if (theme == 'dark') {
// //                   taskData.toggleTheme();
// //                 }
// //                 taskData.init(tasksList);
// //                 initialised = true;
// //               }
// //               print(taskData.tasks);
// //
// //               if (taskData.tasks.length == 0) {
// //                 return Center(
// //                   child: Text(
// //                     'All Task Done',
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       color: Colors.grey,
// //                       fontSize: 20.0,
// //                     ),
// //                   ),
// //                 );
// //               }
// //               return ListView.builder(
// //                 itemBuilder: (context, index) {
// //                   final task = taskData.tasks[index];
// //                   print("taskkkkkk: ${task.isRemindMe}");
// //                   print("time...: ${task.reminderTime}");
// //
// //                   return Dismissible(
// //
// //                     key: UniqueKey(),
// //
// //                     dismissThresholds: {
// //                       DismissDirection.startToEnd: 0.6,
// //                       DismissDirection.endToStart: 0.6,
// //                     },
// //                     onDismissed: (direction) {
// //                       taskData.deleteTask(task);
// //                       Scaffold.of(context).showSnackBar(SnackBar(
// //                         content: Text('Item Removed'),
// //                         action: SnackBarAction(
// //                             label: 'UNDO',
// //                             onPressed: () {
// //                               taskData.addTask(task, index: index);
// //                             }),
// //                       ));
// //                     },
// //
// //                     background: Container(
// //                       color: Colors.red,
// //                       padding: EdgeInsets.only(left: 20.0),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: <Widget>[
// //                           Icon(
// //                             Icons.delete,
// //                             color: Colors.white,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     secondaryBackground: Container(
// //                       padding: EdgeInsets.only(right: 20.0),
// //                       color: Colors.red,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: <Widget>[
// //                           Icon(
// //                             Icons.delete,
// //                             color: Colors.white,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //
// //                     child: task.isRemindMe
// //                         ? TaskTileReminder(
// //                       index: index,
// //                       title: task.title,
// //                       isChecked: task.isChecked,
// //                       reminderDate: task.reminderDate.toString(),
// //                       reminderTime: task.reminderTime,
// //                       callback: (newValue) {
// //                         taskData.toggleCheck(task);
// //                       },
// //                     )
// //                         : TaskTileWithOutReminder(
// //                       index: index,
// //                       title: task.title,
// //                       isChecked: task.isChecked,
// //                       reminderDate: task.reminderDate.toString(),
// //                       callback: (newValue) {
// //                         taskData.toggleCheck(task);
// //                       },
// //                     ),
// //                   );
// //                 },
// //                 itemCount: taskData.tasks.length,
// //               );
// //             },
// //           );
// //         }
// //       },
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TutorialCoachMark Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TutorialCoachMark tutorialCoachMark;
//   List<TargetFocus> targets = <TargetFocus>[];
//
//   GlobalKey keyButton = GlobalKey();
//   GlobalKey keyButton1 = GlobalKey();
//   GlobalKey keyButton2 = GlobalKey();
//   GlobalKey keyButton3 = GlobalKey();
//   GlobalKey keyButton4 = GlobalKey();
//   GlobalKey keyButton5 = GlobalKey();
//
//   @override
//   void initState() {
//     // Future.delayed(Duration.zero, showTutorial);
//     super.initState();
//     setShowTutorial();
//   }
//   setShowTutorial() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     if (prefs.getString('isDone') != null) {
//
//       print("1");
//     }else{
//       print("2");
//       showTutorial();
//
//
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             // key: keyButton1,
//             icon: Icon(Icons.add),
//             onPressed: () {},
//           ),
//           PopupMenuButton(
//             key: keyButton1,
//             icon: Icon(Icons.view_list, color: Colors.white),
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 child: Text("Is this"),
//               ),
//               PopupMenuItem(
//                 child: Text("What"),
//               ),
//               PopupMenuItem(
//                 child: Text("You Want?"),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Stack(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 100.0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   key: keyButton,
//                   color: Colors.blue,
//                   height: 100,
//                   width: MediaQuery.of(context).size.width - 50,
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                       child: Icon(Icons.remove_red_eye),
//                       onPressed: () {
//                         showTutorial();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 50,
//                 height: 50,
//                 child: ElevatedButton(
//                   key: keyButton2,
//                   onPressed: () {},
//                   child: Container(),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: ElevatedButton(
//                     key: keyButton3,
//                     onPressed: () {},
//                     child: Container(),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: ElevatedButton(
//                     key: keyButton4,
//                     onPressed: () {},
//                     child: Container(),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: ElevatedButton(
//                     key: keyButton5,
//                     onPressed: () {},
//                     child: Container(),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void initTargets() {
//     targets.clear();
//     targets.add(
//       TargetFocus(
//         identify: "Target 0",
//         keyTarget: keyButton1,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             builder: (context, controller) {
//               return Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Titulo lorem ipsum",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 20.0),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//     targets.add(
//       TargetFocus(
//         identify: "Target 1",
//         keyTarget: keyButton,
//         color: Colors.purple,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             builder: (context, controller) {
//               return Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Titulo lorem ipsum",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         controller.previous();
//                       },
//                       child: Icon(Icons.chevron_left),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           )
//         ],
//         shape: ShapeLightFocus.RRect,
//         radius: 5,
//       ),
//     );
//     targets.add(
//       TargetFocus(
//         identify: "Target 2",
//         keyTarget: keyButton4,
//         contents: [
//           TargetContent(
//             align: ContentAlign.left,
//             child: Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Multiples content",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 20.0),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0),
//                     child: Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           TargetContent(
//               align: ContentAlign.top,
//               child: Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Multiples content",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 20.0),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//         shape: ShapeLightFocus.RRect,
//       ),
//     );
//     targets.add(TargetFocus(
//       identify: "Target 3",
//       keyTarget: keyButton5,
//       contents: [
//         TargetContent(
//             align: ContentAlign.right,
//             child: Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Title lorem ipsum",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 20.0),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0),
//                     child: Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ))
//       ],
//       shape: ShapeLightFocus.RRect,
//     ));
//     targets.add(TargetFocus(
//       identify: "Target 4",
//       keyTarget: keyButton3,
//       contents: [
//         TargetContent(
//           align: ContentAlign.top,
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 InkWell(
//                   onTap: () {
//                     tutorialCoachMark.previous();
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.network(
//                       "https://juststickers.in/wp-content/uploads/2019/01/flutter.png",
//                       height: 200,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     "Image Load network",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0),
//                   ),
//                 ),
//                 Text(
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//       shape: ShapeLightFocus.Circle,
//     ));
//     targets.add(TargetFocus(
//       identify: "Target 5",
//       keyTarget: keyButton2,
//       contents: [
//         TargetContent(
//           align: ContentAlign.top,
//           child: Container(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     "Multiples contents",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0),
//                   ),
//                 ),
//                 Text(
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         TargetContent(
//             align: ContentAlign.bottom,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     "Multiples contents",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0),
//                   ),
//                 ),
//                 Container(
//                   child: Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ))
//       ],
//       shape: ShapeLightFocus.Circle,
//     ));
//   }
//
//   void showTutorial() {
//     initTargets();
//     tutorialCoachMark = TutorialCoachMark(
//       context,
//       targets: targets,
//       colorShadow: Colors.red,
//       textSkip: "IGNORE FOR NOW",
//       paddingFocus: 10,
//       opacityShadow: 0.8,
//       onFinish: () async{
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//
//         prefs.setString("isDone", "True");
//
//       },
//       onClickTarget: (target) {
//         print('onClickTarget: $target');
//       },
//       onSkip: () {
//         print("skip");
//       },
//       onClickOverlay: (target) {
//         print('onClickOverlay: $target');
//       },
//     )..show();
//   }
// }
