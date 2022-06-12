// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/models/task_data.dart';
// import 'package:todoapp/screens/task_info_screen.dart';
//
// import 'marquee.dart';
//
// class TaskTileReminder extends StatefulWidget {
//   TaskTileReminder(
//       {this.title,
//       this.isChecked,
//       this.callback,
//       this.index,
//       this.reminderDate,
//       this.reminderTime});
//
//   final String title;
//   final DateTime reminderDate;
//   final bool isChecked;
//   final Function callback;
//   final int index;
//   final String reminderTime;
//
//   @override
//   _TaskTileReminderState createState() => _TaskTileReminderState();
// }
//
// class _TaskTileReminderState extends State<TaskTileReminder> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${DateFormat.yMMMd().add_Hm().format(DateTime.now())}");
//     print(">>>>>>>>>>>>>>>>>>>> ${checkDate(
//       widget.reminderDate.toString(),
//     )}");
//   }
//
//   dynamic checkDate(
//     String dateString,
//   ) {
//     //  example, dateString = "2020-01-26";
//
//     DateTime checkedTime = DateTime.parse(dateString);
//     DateTime currentTime = DateTime.now();
//
//     if ((currentTime.year == checkedTime.year) &&
//         (currentTime.month == checkedTime.month) &&
//         (currentTime.day == checkedTime.day)) {
//       return "TODAY";
//     } else if ((currentTime.year == checkedTime.year) &&
//         (currentTime.month == checkedTime.month)) {
//       if ((currentTime.day - checkedTime.day) == 1) {
//         return "YESTERDAY";
//       } else if ((currentTime.day - checkedTime.day) == -1) {
//         return "TOMORROW";
//       } else {
//         return dateString;
//       }
//     }
//   }
//
//   _reminderDateAndTime() {
//     if (checkDate(
//               widget.reminderDate.toString(),
//             ) ==
//             "TODAY" ||
//         checkDate(
//               widget.reminderDate.toString(),
//             ) ==
//             "TOMORROW" ||
//         checkDate(
//               widget.reminderDate.toString(),
//             ) ==
//             "YESTERDAY") {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               checkDate(
//                 widget.reminderDate.toString(),
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 14,
//                 fontFamily: 'cute',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5),
//             child: Text(
//               DateFormat.jm().format(widget.reminderDate),
//               style: TextStyle(
//                 fontFamily: 'cute',
//                 color: Colors.lightGreen.shade700,
//                 fontSize: 11,
//               ),
//             ),
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               DateFormat.yMMMd().format(widget.reminderDate),
//               style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'cutes'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5),
//             child: Text(
//               DateFormat.jm().format(widget.reminderDate),
//               style: TextStyle(
//                 fontFamily: 'cute',
//                 color: Colors.lightGreen.shade700,
//                 fontSize: 11,
//               ),
//             ),
//           ),
//         ],
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onLongPress: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return TaskInfoScreen(
//               index: widget.index,
//               task: Provider.of<TaskData>(context).tasks[widget.index],
//             );
//           }));
//         },
//         // onDoubleTap: () {
//         //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//         //     return TaskInfoScreen(
//         //       index: widget.index,
//         //       task: Provider.of<TaskData>(context).tasks[widget.index],
//         //     );
//         //   }));
//         // },
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _reminderDateAndTime(),
//                   Center(
//                     child: new StatefulBuilder(
//                       builder: (BuildContext context, StateSetter setState) {
//                         return new Transform.scale(
//                           scale: 1.3,
//                           child: new Checkbox(
//                             shape: CircleBorder(),
//                             value: widget.isChecked,
//                             onChanged: widget.callback,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1.0,
//                         blurRadius: 2,
//                         offset: Offset(0, 2), // changes position of shadow
//                       ),
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 height: 100,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: SizedBox(
//                                 width: 220,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 10),
//                                   child: Text(
//                                     widget.title, //60 word
//                                     textAlign: TextAlign.justify,
//                                     style: TextStyle(
//                                         fontFamily: 'cutes',
//                                         decoration: widget.isChecked
//                                             ? TextDecoration.lineThrough
//                                             : null,
//                                         decorationColor: Colors.red,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blueAccent),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               right: 15,
//                               top: 10,
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue.shade100.withOpacity(0.3),
//                                   borderRadius: BorderRadius.circular(12)),
//                               width: 85,
//                               height: 25,
//                               child: Center(
//                                 child: Text(
//                                   widget.isChecked
//                                       ? "Completed ✔️"
//                                       : "UpComing",
//                                   style: TextStyle(
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'cutes',
//                                       color: widget.isChecked
//                                           ? Colors.green
//                                           : Colors.red),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(width: 10,),
//                             Container(
//                               height: 28,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue.shade100.withOpacity(0.3),
//                                   borderRadius: BorderRadius.circular(12)),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(
//                                   child: Text(
//                                     "❌ Swipe Left to Delete",
//                                     style: TextStyle(
//                                         fontSize: 9,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.blue),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10,),
//                             GestureDetector(
//
//
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                                   return TaskInfoScreen(
//                                     index: widget.index,
//                                     task: Provider.of<TaskData>(context).tasks[widget.index],
//                                   );
//                                 }));
//                               },
//
//                               child: Container(
//                                 height: 28,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue.shade100.withOpacity(0.3),
//                                     borderRadius: BorderRadius.circular(12)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Center(
//                                     child: Text(
//                                       "✏️ Click to Edit",
//                                       style: TextStyle(
//                                           fontSize: 9,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.blue),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//
//         // ListTile(
//         //   title: Column(
//         //     children: [
//         //       Text(
//         //         widget.title,
//         //         style: TextStyle(
//         //           decoration:
//         //           widget.isChecked ? TextDecoration.lineThrough : null,
//         //         ),
//         //       ),
//         //       Text(
//         //         widget.reminderTime,
//         //         style: TextStyle(
//         //           decoration:
//         //           widget.isChecked ? TextDecoration.lineThrough : null,
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         //   trailing: Checkbox(
//         //     activeColor: Colors.lightBlueAccent,
//         //     value: widget.isChecked,
//         //     onChanged: widget.callback,
//         //   ),
//         // ),
//         );
//   }
// }

/// 2nd design

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/task_data.dart';
import 'task_info_screen.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'marquee.dart';

class TaskTileReminder extends StatefulWidget {
  TaskTileReminder(
      {this.title,
      this.isChecked,
      this.callback,
      this.index,
      this.reminderDate,
      this.reminderTime});

  final String title;
  final DateTime reminderDate;
  final bool isChecked;
  final Function callback;
  final int index;
  final String reminderTime;

  @override
  _TaskTileReminderState createState() => _TaskTileReminderState();
}

class _TaskTileReminderState extends State<TaskTileReminder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setShowTutorial();
  }

  dynamic checkDate(
    String dateString,
  ) {
    //  example, dateString = "2020-01-26";

    DateTime checkedTime = DateTime.parse(dateString);
    DateTime currentTime = DateTime.now();

    if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month) &&
        (currentTime.day == checkedTime.day)) {
      return "TODAY";
    } else if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month)) {
      if ((currentTime.day - checkedTime.day) == 1) {
        return "YESTERDAY";
      } else if ((currentTime.day - checkedTime.day) == -1) {
        return "TOMORROW";
      } else {
        return dateString;
      }
    }
  }

  _reminderDateAndTime() {
    if (checkDate(
              widget.reminderDate.toString(),
            ) ==
            "TODAY" ||
        checkDate(
              widget.reminderDate.toString(),
            ) ==
            "TOMORROW" ||
        checkDate(
              widget.reminderDate.toString(),
            ) ==
            "YESTERDAY") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 10, bottom: 0),
        child: Row(

          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.campaign,
                  color: widget.isChecked ? Colors.green : Colors.purple
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                widget.isChecked ? "Completed ✔️ " : "UpComing:",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'cute',
                    color: widget.isChecked ? Colors.green : Colors.purple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 0, left: 8, right: 8),
              child: Text(
                checkDate(
                  widget.reminderDate.toString(),
                ).toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontFamily: 'cute',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 0),
              child: Text(
              "at " +  DateFormat.jm().format(widget.reminderDate),
                style: TextStyle(
                  fontFamily: 'cute',
                  color: Colors.lightGreen.shade700,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 10, bottom: 2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.campaign,
                  color: widget.isChecked ? Colors.green : Colors.purple              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                widget.isChecked ? "Completed ✔️" : "UpComing:",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'cute',
                    color: widget.isChecked ? Colors.green : Colors.purple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 3),
              child: Text(
                DateFormat.yMMMd().format(widget.reminderDate),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontFamily: 'cute'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 0),
              child: Text(
             "at "+   DateFormat.jm().format(widget.reminderDate),
                style: TextStyle(
                  fontFamily: 'cute',
                  color: Colors.lightGreen.shade700,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
      child: GestureDetector(
          key: deleteTask,
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TaskInfoScreen(
                isCheck: true,
                index: widget.index,
                task: Provider.of<TaskData>(context).tasks[widget.index],
              );
            }));
          },
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       // Text(
              //       //   widget.isChecked ? "Completed ✔️" : "UpComing",
              //       //   style: TextStyle(
              //       //       fontSize: 12,
              //       //       fontFamily: 'cute',
              //       //       color: widget.isChecked ? Colors.green : Colors.red),
              //       // ),
              //       _reminderDateAndTime(),
              //
              //     ],
              //   ),
              // ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                child: Container(

                  height: 140,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        _reminderDateAndTime(),
                        Divider(
                          thickness: 1,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 6),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text("Task: ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'cute',
                                  color: Colors.orange.shade700
                                ),)
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  widget.title, //60 word
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'cute',

                                      decoration: widget.isChecked
                                          ? TextDecoration.lineThrough
                                          : null,
                                      decorationColor: Colors.red,

                                      fontSize: 12,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),

                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade100.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Center(
                                        child: Text(
                                          "Swipe To Delete",
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return TaskInfoScreen(
                                          isCheck: true,
                                          index: widget.index,
                                          task: Provider.of<TaskData>(context)
                                              .tasks[widget.index],
                                        );
                                      }));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.blue.shade100.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Edit ",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 2),
                                              child: Icon(Icons.edit,
                                              size: 10,
                                              color: Colors.blue,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Check if Done: ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'cute',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                  new StatefulBuilder(
                                    builder:
                                        (BuildContext context, StateSetter setState) {
                                      return new Transform.scale(
                                        scale: 1.5,
                                        child: new Checkbox(
                                          shape: CircleBorder(),
                                          value: widget.isChecked,
                                          onChanged: widget.callback,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),

            ],
          )),
    );
  }

  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];
  GlobalKey deleteTask = GlobalKey();

  setShowTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('isDone3') != null) {
      print(">>>>>>>>>>>fFFFDFDFDFDFDFDFDFdfdfdfdfdfdfdfdfdfdf");
    } else {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
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
          keyTarget: deleteTask,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Slide Left or Right to delete Task",
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
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.blue,
      textSkip: "Skip",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("isDone3", "True");
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
}
