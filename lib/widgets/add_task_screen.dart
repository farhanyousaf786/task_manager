// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:provider/provider.dart';
// // import 'package:todoapp/models/task.dart';
// // import 'package:todoapp/models/task_data.dart';
// //
// // import '../main.dart';
// //
// // class AddTaskScreen extends StatefulWidget {
// //   static String id = 'AddTaskScreen';
// //
// //   @override
// //   _AddTaskScreenState createState() => _AddTaskScreenState();
// // }
// //
// // class _AddTaskScreenState extends State<AddTaskScreen> {
// //   final taskController = TextEditingController();
// //
// //   String currTask = '';
// //   bool remindMe = false;
// //   DateTime reminderDate;
// //   TimeOfDay reminderTime;
// //   int id;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.transparent,
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Theme.of(context).cardColor,
// //           borderRadius: BorderRadius.only(
// //             topRight: Radius.circular(30.0),
// //             topLeft: Radius.circular(30.0),
// //           ),
// //         ),
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: <Widget>[
// //               Text(
// //                 'Task Name',
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.lightBlueAccent,
// //                   fontFamily: 'cute',
// //                   fontSize: 25.0,
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 15,
// //               ),
// //               TextField(
// //                 controller: taskController,
// //                 autofocus: true,
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   fontSize: 16.0,
// //                 ),
// //                 textCapitalization: TextCapitalization.sentences,
// //                 onChanged: (newVal) {
// //                   currTask = newVal;
// //                 },
// //                 decoration: InputDecoration(
// //                   fillColor: Colors.blue.shade50,
// //                   isDense: true,
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.all(Radius.circular(20)),
// //                     borderSide:
// //                         new BorderSide(color: Colors.blue.shade700, width: 1),
// //                   ),
// //                   filled: true,
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.all(Radius.circular(20)),
// //                     borderSide:
// //                         new BorderSide(color: Colors.blue.shade700, width: 1),
// //                   ),
// //                   labelText: ' Task',
// //                   labelStyle: TextStyle(
// //                     fontFamily: "Cutes",
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.blue.shade700,
// //                     fontSize: 10,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 10.0,
// //               ),
// //               SwitchListTile(
// //                 value: remindMe,
// //                 title: Text('Reminder'),
// //                 onChanged: (newValue) async {
// //                   if (newValue) {
// //                     reminderDate = await showDatePicker(
// //                       context: context,
// //                       initialDate: DateTime.now(),
// //                       firstDate: DateTime.now(),
// //                       lastDate: DateTime(DateTime.now().year + 2),
// //                     );
// //
// //                     if (reminderDate == null) {
// //                       return;
// //                     }
// //
// //                     reminderTime = await showTimePicker(
// //                         context: context, initialTime: TimeOfDay.now());
// //
// //                     if (reminderDate != null && reminderTime != null) {
// //                       remindMe = newValue;
// //                     }
// //                   } else {
// //                     reminderDate = null;
// //                     reminderTime = null;
// //                     remindMe = newValue;
// //                   }
// //
// //                   setState(() {});
// //                 },
// //                 subtitle: Text('Remind me about this item'),
// //               ),
// //               SizedBox(
// //                 height: 10.0,
// //               ),
// //               Container(
// //                   child: remindMe
// //                       ? Text('Reminder set at: ' +
// //                           DateTime(
// //                                   reminderDate.year,
// //                                   reminderDate.month,
// //                                   reminderDate.day,
// //                                   reminderTime.hour,
// //                                   reminderTime.minute)
// //                               .toString())
// //                       : null),
// //               SizedBox(
// //                 height: remindMe ? 10.0 : 0.0,
// //               ),
// //               FlatButton(
// //                 color: Colors.lightBlueAccent,
// //                 onPressed: () async {
// //                   if (remindMe) {
// //                     var scheduledNotificationDateTime = reminderDate
// //                         .add(Duration(
// //                             hours: reminderTime.hour,
// //                             minutes: reminderTime.minute))
// //                         .subtract(Duration(seconds: 5));
// //
// //                     var androidPlatformChannelSpecifics =
// //                         AndroidNotificationDetails(
// //                       currTask,
// //                       'To Do Notification',
// //                       'Do the task',
// //                       priority: Priority.max,
// //                       importance: Importance.max,
// //                       playSound: true,
// //                     );
// //                     var iOSPlatformChannelSpecifics = IOSNotificationDetails();
// //                     NotificationDetails platformChannelSpecifics =
// //                         NotificationDetails(
// //                             android: androidPlatformChannelSpecifics,
// //                             iOS: iOSPlatformChannelSpecifics);
// //                     id = Provider.of<TaskData>(context, listen: false)
// //                         .tasks
// //                         .length;
// //                     print("id:  $id");
// //                     await flutterLocalNotificationsPlugin.schedule(
// //                         id,
// //                         'Task reminder',
// //                         'It is time for your task: $currTask',
// //                         scheduledNotificationDateTime,
// //                         platformChannelSpecifics);
// //                   }
// //
// //                   TimeOfDay _selectedTime;
// //                   String rTime;
// //
// //                   if (reminderTime != null) {
// //                     setState(() {
// //                       _selectedTime = reminderTime.replacing(
// //                           hour: reminderTime.hourOfPeriod);
// //                       print(
// //                           "22222222222222222 >> ${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()}");
// //
// //                       rTime = _selectedTime.hour.toString() +
// //                           ":" +
// //                           _selectedTime.minute.toString();
// //                     });
// //                   }
// //
// //                   await Provider.of<TaskData>(
// //                     context,
// //                     listen: false,
// //                   ).addTask(Task(
// //                     reminderTime: rTime,
// //                     title: currTask,
// //                     isChecked: false,
// //                     isRemindMe: remindMe,
// //                     reminderDate: reminderDate == null
// //                         ? null
// //                         : reminderDate.add(Duration(
// //                             hours: reminderTime.hour,
// //                             minutes: reminderTime.minute,
// //                           )),
// //                     reminderId: reminderDate != null ? id : null,
// //                   ));
// //                   Navigator.pop(context);
// //                 },
// //                 child: Text(
// //                   'ADD TASK',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// ///
// ///
// ///
//
// import 'package:facebook_audience_network/ad/ad_native.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todoapp/models/task.dart';
// import 'package:todoapp/models/task_data.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
//
// import '../main.dart';
//
// class AddTaskScreen extends StatefulWidget {
//   static String id = 'AddTaskScreen';
//
//   @override
//   _AddTaskScreenState createState() => _AddTaskScreenState();
// }
//
// class _AddTaskScreenState extends State<AddTaskScreen> {
//   final taskController = TextEditingController();
//
//   String currTask = '';
//   bool remindMe = false;
//   DateTime reminderDate;
//   TimeOfDay reminderTime;
//   int id;
//   TutorialCoachMark tutorialCoachMark;
//   List<TargetFocus> targets = <TargetFocus>[];
//   GlobalKey addTask = GlobalKey();
//   GlobalKey addTask2 = GlobalKey();
//
//   @override
//   void initState() {
//     // Future.delayed(Duration.zero, showTutorial);
//     super.initState();
//     setShowTutorial();
//     // _showNativeBannerAd();
//   }
//
//   setShowTutorial() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     if (prefs.getString('isDone2') != null) {
//       print("1");
//     } else {
//       print("2");
//       Future.delayed(Duration(seconds: 1), () {
//         showTutorial();
//       });
//     }
//   }
//
//   void initTargets() {
//     targets.clear();
//     targets.add(
//       TargetFocus(
//           identify: "Target",
//           keyTarget: addTask,
//           contents: [
//             TargetContent(
//               align: ContentAlign.top,
//               builder: (context, controller) {
//                 return Container(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Right Task Name",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 22.0),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0),
//                         child: Text(
//                           "",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//           shape: ShapeLightFocus.RRect),
//     );
//     targets.add(
//       TargetFocus(
//           identify: "Target",
//           keyTarget: addTask2,
//           contents: [
//             TargetContent(
//               align: ContentAlign.top,
//               builder: (context, controller) {
//                 return Container(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Click Here to Set Reminder Time",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 22.0),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0),
//                         child: Text(
//                           "And than click add task to finish",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//           shape: ShapeLightFocus.RRect),
//     );
//   }
//
//   void showTutorial() {
//     initTargets();
//     tutorialCoachMark = TutorialCoachMark(
//       context,
//       targets: targets,
//       colorShadow: Colors.blue,
//       textSkip: "Skip",
//       paddingFocus: 10,
//       opacityShadow: 0.8,
//       onFinish: () async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//
//         prefs.setString("isDone2", "True");
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
//     )
//       ..show();
//   }
//
//   Widget _currentAd = SizedBox(
//     width: 0.0,
//     height: 0.0,
//   );
//
//   _showNativeBannerAd() {
//     setState(() {
//       _currentAd = _nativeBannerAd();
//     });
//   }
//
//   Widget _nativeBannerAd() {
//     return FacebookNativeAd(
//       // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
//       placementId: "1023819944825921_1023825334825382",
//       adType: NativeAdType.NATIVE_BANNER_AD,
//       bannerAdSize: NativeBannerAdSize.HEIGHT_100,
//       width: double.infinity,
//       listener: (result, value) {
//         print("Native Banner Ad: $result --> $value");
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme
//               .of(context)
//               .cardColor,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(30.0),
//             topLeft: Radius.circular(30.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width / 1.2,
//                 child: SizedBox(
//
//                     height: 100,
//                     child: _currentAd)),
//             Container(
//               width: 160,
//               height: 160,
//               child: Lottie.asset('assets/task.json'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Task Name',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.lightBlueAccent,
//                 fontFamily: 'cute',
//                 fontSize: 20.0,
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               height: 80,
//               padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
//               child: TextField(
//                 key: addTask,
//                 controller: taskController,
//                 maxLength: 50,
//                 autofocus: true,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//                 textCapitalization: TextCapitalization.sentences,
//                 onChanged: (newVal) {
//                   currTask = newVal;
//                 },
//                 decoration: InputDecoration(
//                   fillColor: Colors.blue.shade50,
//                   isDense: true,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     borderSide:
//                     new BorderSide(color: Colors.blue.shade700, width: 1),
//                   ),
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     borderSide:
//                     new BorderSide(color: Colors.blue.shade700, width: 1),
//                   ),
//                   labelText: ' Task',
//                   labelStyle: TextStyle(
//                     fontFamily: "Cutes",
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue.shade700,
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               children: [
//                 Checkbox(
//                   value: this.remindMe,
//                   onChanged: (bool value) {
//                     setState(() {
//                       this.remindMe = value;
//                     });
//                   },
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     reminderDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(DateTime
//                           .now()
//                           .year + 2),
//                     );
//
//                     if (reminderDate == null) {
//                       return;
//                     }
//
//                     reminderTime = await showTimePicker(
//                         context: context, initialTime: TimeOfDay.now());
//
//                     if (reminderDate != null && reminderTime != null) {}
//
//
//                     setState(() {});
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 45, right: 45),
//                     child: Container(
//                       key: addTask2,
//                       height: 40,
//                       decoration: BoxDecoration(color: Colors.blue.shade50),
//                       child: Center(
//                         child: Text(
//                           'Click to Set Reminder ⏰',
//                           style: TextStyle(
//                             fontFamily: "Cute",
//                             color: Colors.blue,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Container(
//                 //     child: remindMe
//                 //         ? Text(
//                 //       'Reminder set at ',
//                 //       style: TextStyle(
//                 //           color: Colors.blue,
//                 //           fontSize: 15,
//                 //           fontFamily: 'cute'),
//                 //     )
//                 //         : null),
//                 // Container(
//                 //     child: remindMe
//                 //         ? Text(
//                 //       DateFormat.yMMMd().format(reminderDate) + "  ",
//                 //       style: TextStyle(
//                 //           color: Colors.green,
//                 //           fontSize: 14,
//                 //           fontFamily: 'cutes'),
//                 //     )
//                 //         : null),
//                 // Container(
//                 //     child: remindMe
//                 //         ? Text(
//                 //       reminderTime.hour.toString() +
//                 //           ":" +
//                 //           reminderTime.minute.toString(),
//                 //       style: TextStyle(
//                 //           color: Colors.green,
//                 //           fontSize: 13,
//                 //           fontFamily: 'cutes'),
//                 //     )
//                 //         : null),
//               ],
//             ),
//             SizedBox(
//               height: remindMe ? 20.0 : 0.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Container(
//                 height: 35,
//                 padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
//                 child: FlatButton(
//                   color: Colors.blue.shade50,
//                   onPressed: () async {
//                     if (remindMe) {
//                       var scheduledNotificationDateTime = reminderDate
//                           .add(Duration(
//                           hours: reminderTime.hour,
//                           minutes: reminderTime.minute))
//                           .subtract(Duration(seconds: 5));
//
//                       var androidPlatformChannelSpecifics =
//                       AndroidNotificationDetails(
//                         currTask,
//                         'To Do Notification',
//                         'Do the task',
//                         priority: Priority.max,
//                         importance: Importance.max,
//                         largeIcon: DrawableResourceAndroidBitmap(
//                             "@mipmap/ic_launcher"),
//                         styleInformation: MediaStyleInformation(
//                           htmlFormatContent: true,
//                           htmlFormatTitle: true,
//                         ),
//                         sound: RawResourceAndroidNotificationSound(
//                             'notification1'),
//                         playSound: true,
//                       );
//                       var iOSPlatformChannelSpecifics =
//                       IOSNotificationDetails();
//                       NotificationDetails platformChannelSpecifics =
//                       NotificationDetails(
//                           android: androidPlatformChannelSpecifics,
//                           iOS: iOSPlatformChannelSpecifics);
//                       id = Provider
//                           .of<TaskData>(context, listen: false)
//                           .tasks
//                           .length;
//                       print("id:  $id");
//                       await flutterLocalNotificationsPlugin.schedule(
//                           id,
//                           'Task Reminder',
//                           'Time For: $currTask',
//                           scheduledNotificationDateTime,
//                           platformChannelSpecifics);
//
//                       TimeOfDay _selectedTime;
//                       String rTime;
//
//                       if (reminderTime != null) {
//                         setState(() {
//                           _selectedTime = reminderTime.replacing(
//                               hour: reminderTime.hourOfPeriod);
//
//                           rTime = _selectedTime.hour.toString() +
//                               ":" +
//                               _selectedTime.minute.toString();
//                         });
//                       }
//
//                       await Provider.of<TaskData>(
//                         context,
//                         listen: false,
//                       ).addTask(Task(
//                         reminderTime: rTime,
//                         title: currTask,
//                         isChecked: false,
//                         isRemindMe: remindMe,
//                         reminderDate: reminderDate == null
//                             ? null
//                             : reminderDate.add(Duration(
//                           hours: reminderTime.hour,
//                           minutes: reminderTime.minute,
//                         )),
//                         reminderId: reminderDate != null ? id : null,
//                       ));
//                       Navigator.pop(context);
//                     } else {
//                       Fluttertoast.showToast(
//                         msg: "Click to Set Reminder",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.TOP,
//                         timeInSecForIosWeb: 1,
//                         backgroundColor: Colors.blue.shade100,
//                         textColor: Colors.blue,
//                         fontSize: 15.0,
//                       );
//                     }
//                   },
//                   child: Text(
//                     'ADD TASK',
//                     style: TextStyle(color: Colors.blue, fontFamily: 'cute'),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

///
///
///

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/models/task.dart';
// import 'package:todoapp/models/task_data.dart';
//
// import '../main.dart';
//
// class AddTaskScreen extends StatefulWidget {
//   static String id = 'AddTaskScreen';
//
//   @override
//   _AddTaskScreenState createState() => _AddTaskScreenState();
// }
//
// class _AddTaskScreenState extends State<AddTaskScreen> {
//   final taskController = TextEditingController();
//
//   String currTask = '';
//   bool remindMe = false;
//   DateTime reminderDate;
//   TimeOfDay reminderTime;
//   int id;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).cardColor,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(30.0),
//             topLeft: Radius.circular(30.0),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Task Name',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.lightBlueAccent,
//                   fontFamily: 'cute',
//                   fontSize: 25.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextField(
//                 controller: taskController,
//                 autofocus: true,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//                 textCapitalization: TextCapitalization.sentences,
//                 onChanged: (newVal) {
//                   currTask = newVal;
//                 },
//                 decoration: InputDecoration(
//                   fillColor: Colors.blue.shade50,
//                   isDense: true,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     borderSide:
//                         new BorderSide(color: Colors.blue.shade700, width: 1),
//                   ),
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     borderSide:
//                         new BorderSide(color: Colors.blue.shade700, width: 1),
//                   ),
//                   labelText: ' Task',
//                   labelStyle: TextStyle(
//                     fontFamily: "Cutes",
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue.shade700,
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               SwitchListTile(
//                 value: remindMe,
//                 title: Text('Reminder'),
//                 onChanged: (newValue) async {
//                   if (newValue) {
//                     reminderDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(DateTime.now().year + 2),
//                     );
//
//                     if (reminderDate == null) {
//                       return;
//                     }
//
//                     reminderTime = await showTimePicker(
//                         context: context, initialTime: TimeOfDay.now());
//
//                     if (reminderDate != null && reminderTime != null) {
//                       remindMe = newValue;
//                     }
//                   } else {
//                     reminderDate = null;
//                     reminderTime = null;
//                     remindMe = newValue;
//                   }
//
//                   setState(() {});
//                 },
//                 subtitle: Text('Remind me about this item'),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Container(
//                   child: remindMe
//                       ? Text('Reminder set at: ' +
//                           DateTime(
//                                   reminderDate.year,
//                                   reminderDate.month,
//                                   reminderDate.day,
//                                   reminderTime.hour,
//                                   reminderTime.minute)
//                               .toString())
//                       : null),
//               SizedBox(
//                 height: remindMe ? 10.0 : 0.0,
//               ),
//               FlatButton(
//                 color: Colors.lightBlueAccent,
//                 onPressed: () async {
//                   if (remindMe) {
//                     var scheduledNotificationDateTime = reminderDate
//                         .add(Duration(
//                             hours: reminderTime.hour,
//                             minutes: reminderTime.minute))
//                         .subtract(Duration(seconds: 5));
//
//                     var androidPlatformChannelSpecifics =
//                         AndroidNotificationDetails(
//                       currTask,
//                       'To Do Notification',
//                       'Do the task',
//                       priority: Priority.max,
//                       importance: Importance.max,
//                       playSound: true,
//                     );
//                     var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//                     NotificationDetails platformChannelSpecifics =
//                         NotificationDetails(
//                             android: androidPlatformChannelSpecifics,
//                             iOS: iOSPlatformChannelSpecifics);
//                     id = Provider.of<TaskData>(context, listen: false)
//                         .tasks
//                         .length;
//                     print("id:  $id");
//                     await flutterLocalNotificationsPlugin.schedule(
//                         id,
//                         'Task reminder',
//                         'It is time for your task: $currTask',
//                         scheduledNotificationDateTime,
//                         platformChannelSpecifics);
//                   }
//
//                   TimeOfDay _selectedTime;
//                   String rTime;
//
//                   if (reminderTime != null) {
//                     setState(() {
//                       _selectedTime = reminderTime.replacing(
//                           hour: reminderTime.hourOfPeriod);
//                       print(
//                           "22222222222222222 >> ${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()}");
//
//                       rTime = _selectedTime.hour.toString() +
//                           ":" +
//                           _selectedTime.minute.toString();
//                     });
//                   }
//
//                   await Provider.of<TaskData>(
//                     context,
//                     listen: false,
//                   ).addTask(Task(
//                     reminderTime: rTime,
//                     title: currTask,
//                     isChecked: false,
//                     isRemindMe: remindMe,
//                     reminderDate: reminderDate == null
//                         ? null
//                         : reminderDate.add(Duration(
//                             hours: reminderTime.hour,
//                             minutes: reminderTime.minute,
//                           )),
//                     reminderId: reminderDate != null ? id : null,
//                   ));
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'ADD TASK',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///
///

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../main.dart';

class AddTaskScreen extends StatefulWidget {
  static String id = 'AddTaskScreen';

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskController = TextEditingController();

  String currTask = '';
  bool remindMe = false;
  bool isCheck = false;

  DateTime reminderDate;
  TimeOfDay reminderTime;
  int id;
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];
  GlobalKey addTask = GlobalKey();
  GlobalKey addTask2 = GlobalKey();
  GlobalKey addTask3 = GlobalKey();

  @override
  void initState() {
    FacebookAudienceNetwork.init();
    _loadInterstitialAd();
    setShowTutorial();

    super.initState();


  }


  bool _isInterstitialAdLoaded = false;

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "1292597874911800_1293167998188121",
      // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }


  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();

    else
      print("Interstial Ad not yet loaded!");
  }





  setShowTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('isDone2') != null) {
      print("1");
    } else {
      print("2");
      Future.delayed(Duration(seconds: 1), () {
        showTutorial();
      });
    }
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
          identify: "Target",
          keyTarget: addTask,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Write Task Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          shape: ShapeLightFocus.RRect),
    );
    targets.add(
      TargetFocus(
          identify: "Target",
          keyTarget: addTask2,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Click Here If You want to set Date and Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "After this click on > Click Here to Set Reminder Time",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          shape: ShapeLightFocus.RRect),
    );

    targets.add(
      TargetFocus(
          identify: "Target",
          keyTarget: addTask3,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Click Here to Set Reminder Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "And than click add task to finish",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          shape: ShapeLightFocus.RRect),
    );
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.blue,
      textSkip: "Skip",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("isDone2", "True");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        print("skip");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    )..show();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Container(
              width: 120,
              height: 120,
              child: Lottie.asset('assets/task.json'),
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              'Task Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontFamily: 'cute',
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 65,
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                key: addTask,
                controller: taskController,
                maxLength: 50,
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (newVal) {
                  currTask = newVal;
                },
                decoration: InputDecoration(
                  fillColor: Colors.blue.shade50,
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        new BorderSide(color: Colors.blue.shade700, width: 1),
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        new BorderSide(color: Colors.blue.shade700, width: 1),
                  ),
                  labelText: ' Task',
                  labelStyle: TextStyle(
                    fontFamily: "Cutes",
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       key: addTask2,
            //       value: this.remindMe,
            //       onChanged: (bool value) {
            //         setState(() {
            //           this.remindMe = value;
            //         });
            //       },
            //     ),
            //     remindMe
            //         ? Padding(
            //             key: addTask3,
            //             padding: const EdgeInsets.only(right: 15),
            //             child: GestureDetector(
            //               child: Text(
            //                 'Reminder',
            //                 style: TextStyle(
            //                   fontFamily: "Cute",
            //                   color: Colors.red.shade200,
            //                   fontSize: 15,
            //                 ),
            //               ),
            //             ),
            //           )
            //         : Padding(
            //             key: addTask3,
            //             padding: const EdgeInsets.only(right: 15),
            //             child: GestureDetector(
            //               child: Text(
            //                 'Reminder',
            //                 style: TextStyle(
            //                   fontFamily: "Cute",
            //                   color: Colors.red.shade200,
            //                   fontSize: 15,
            //                 ),
            //               ),
            //             ),
            //           ),
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
              child: TextButton(

                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade50
                ),
                onPressed: ()async {
                  setState(() {
                    remindMe = true;
                  });

                  reminderDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 2),
                  );

                  if (reminderDate == null) {
                    return;
                  }
                  reminderTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  if (reminderDate != null && reminderTime != null) {}

                  setState(() {
                    isCheck = true;
                  });
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0, bottom: 2, top: 2),
                    child: Text(
                      'Click to Set Reminder ⏰',
                      style: TextStyle(
                        fontFamily: "Cute",
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            isCheck
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: remindMe
                              ? Text(
                                  DateFormat.yMMMd().format(reminderDate) +
                                      "  ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontFamily: 'cutes'),
                                )
                              : null),
                      Container(
                          child: remindMe
                              ? Text(
                                  reminderTime.hour.toString() +
                                      ":" +
                                      reminderTime.minute.toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 13,
                                      fontFamily: 'cutes'),
                                )
                              : null),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 5.0,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Container(
                height: 30,
                padding: EdgeInsets.only(left: 80, right: 80),
                child: ElevatedButton(
                  onPressed: () async {
                    if (remindMe) {
                      if (taskController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Write Task Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (isCheck == false) {
                        Fluttertoast.showToast(
                            msg: "Click to set Reminder",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        var scheduledNotificationDateTime = reminderDate
                            .add(Duration(
                                hours: reminderTime.hour,
                                minutes: reminderTime.minute))
                            .subtract(Duration(seconds: 5));

                        var androidPlatformChannelSpecifics =
                            AndroidNotificationDetails(
                          currTask,
                          'To Do Notification',
                          // 'Do the task',
                          priority: Priority.max,
                          importance: Importance.max,
                          largeIcon: DrawableResourceAndroidBitmap(
                              "@mipmap/ic_launcher"),
                          styleInformation: MediaStyleInformation(
                            htmlFormatContent: true,
                            htmlFormatTitle: true,
                          ),
                          sound: RawResourceAndroidNotificationSound(
                              'notification1'),
                          playSound: true,
                        );

                        NotificationDetails platformChannelSpecifics =
                            NotificationDetails(
                                android: androidPlatformChannelSpecifics,
                                );
                        id = Provider.of<TaskData>(context, listen: false)
                            .tasks
                            .length;
                        print("id:  $id");
                        await flutterLocalNotificationsPlugin.schedule(
                            id,
                            'Task Reminder',
                            'Time For: $currTask',
                            scheduledNotificationDateTime,
                            platformChannelSpecifics);

                        TimeOfDay _selectedTime;
                        String rTime;

                        if (reminderTime != null) {
                          setState(() {
                            _selectedTime = reminderTime.replacing(
                                hour: reminderTime.hourOfPeriod);

                            rTime = _selectedTime.hour.toString() +
                                ":" +
                                _selectedTime.minute.toString();
                          });
                        }

                        await Provider.of<TaskData>(
                          context,
                          listen: false,
                        ).addTask(
                          Task(
                            reminderTime: rTime,
                            title: currTask,
                            isChecked: false,
                            isRemindMe: remindMe,
                            reminderDate: reminderDate == null
                                ? null
                                : reminderDate.add(Duration(
                              hours: reminderTime.hour,
                              minutes: reminderTime.minute,
                            )),
                            reminderId: reminderDate != null ? id : null,
                          ),
                        );


                        Fluttertoast.showToast(
                            msg: "Task Added to Reminder List",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        _showInterstitialAd();
                        Navigator.pop(context);
                      }
                    } else {
                      await Provider.of<TaskData>(
                        context,
                        listen: false,
                      ).addTask(Task(
                        reminderTime: null,
                        title: currTask,
                        isChecked: false,
                        isRemindMe: false,
                        reminderDate: reminderDate == null
                            ? null
                            : reminderDate.add(Duration(
                                hours: reminderTime.hour,
                                minutes: reminderTime.minute,
                              )),
                        reminderId: reminderDate != null ? id : null,
                      ));

                      Fluttertoast.showToast(
                          msg: "Task Added To Task List",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                         _showInterstitialAd();
                         Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'ADD TASK',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'cute', fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
