// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/models/task.dart';
// import 'package:todoapp/models/task_data.dart';
// import 'package:todoapp/screens/settings_screen.dart';
// import 'package:todoapp/widgets/TaskListReminder.dart';
// import 'package:todoapp/widgets/TileWithoutReminder.dart';
//
// import 'app_info_screen.dart';
// import 'instructions_screen.dart';
//
// final LocalStorage localStorage = LocalStorage('toDoList.json');
//
// bool initialised = false;
// List tasksList = [];
// String theme;
//
// class TaskReminderList extends StatefulWidget {
//   @override
//   _TaskReminderListState createState() => _TaskReminderListState();
// }
//
// class _TaskReminderListState extends State<TaskReminderList> {
//   Future<bool> get getData async {
//     await localStorage.ready;
//
//     if (localStorage != null) {
//       theme = await localStorage.getItem('theme');
//
//       tasksList = await localStorage.getItem('todos');
//       print(theme);
//       print("task list: $tasksList");
//       if (tasksList == null) {
//         tasksList = [
//           // Task(
//           //     title: 'This Is A Task, Hold to view details.',
//           //     isRemindMe: false),
//           // Task(
//           //     title: 'Click the + button, to add a new task',
//           //     isRemindMe: false),
//           // Task(title: 'Check the task, to mark it complete', isRemindMe: false),
//           // Task(
//           //     title: 'Swipe in any direction to delete the task.',
//           //     isRemindMe: false),
//         ].map((e) => e.toJson()).toList();
//       }
//     }
//
//     return true;
//   }
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getData,
//       builder: (context, snapshot) {
//         print("snapshot: >>>> ${snapshot.data}");
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return Consumer<TaskData>(
//             builder: (context, taskData, child) {
//               if (!initialised) {
//                 if (theme == 'dark') {
//                   taskData.toggleTheme();
//                 }
//                 taskData.init(tasksList);
//                 initialised = true;
//               }
//               print(taskData.tasks);
//
//               if (taskData.tasks.length == 0) {
//                 return Scaffold(
//                   appBar: AppBar(
//                     title: Text("Remainder List"),
//                   ),
//                   body: Center(
//                     child: Text(
//                       'There is no Task',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               return Scaffold(
//                 backgroundColor: Colors.white,
//                 drawer: Drawer(
//
//                   child: SafeArea(
//
//                     child: ListView(
//                       padding: EdgeInsets.only(top: 20.0),
//
//                       children: <Widget>[
//                         ListTile(
//                           leading: Icon(Icons.info),
//                           title: Text('About'),
//                           onTap: () {
//                             Navigator.pushNamed(context, AppInfoScreen.id);
//                           },
//                         ),
//                         ListTile(
//                             leading: Icon(FontAwesomeIcons.tasks),
//                             title: Text('How to use'),
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, InstructionsScreen.id);
//                             }),
//                         ListTile(
//                           leading: Icon(Icons.settings),
//                           title: Text('Settings'),
//                           onTap: () {
//                             Navigator.pushNamed(context, SettingsScreen.id);
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 key: _scaffoldKey,
//                 appBar: AppBar(
//                   backgroundColor: Colors.white,
//                   elevation: 0.0,
//                   title: Text("Reminder List",
//                   style: TextStyle(
//                     color: Colors.lightBlue
//                   ),),
//                   centerTitle: true,
//                   leading: GestureDetector(
//                     onTap: ()=> {_scaffoldKey.currentState.openDrawer(),                    },
//                     child: Icon(
//                       Icons.list,
//                       size: 25.0,
//                       color: Colors.lightBlue,
//                     ),
//                   ),
//                 ),
//                 body: ListView.builder(
//                   itemBuilder: (context, index) {
//                     final task = taskData.tasks[index];
//                     print("taskkkkkk: ${task.isRemindMe}");
//                     print("time...: ${task.reminderTime}");
//
//                     return Dismissible(
//                       key: UniqueKey(),
//                       dismissThresholds: {
//                         DismissDirection.startToEnd: 0.6,
//                         DismissDirection.endToStart: 0.6,
//                       },
//                       onDismissed: (direction) {
//                         taskData.deleteTask(task);
//                         Scaffold.of(context).showSnackBar(SnackBar(
//                           content: Text('Item Removed'),
//                           action: SnackBarAction(
//                               label: 'UNDO',
//                               onPressed: () {
//                                 taskData.addTask(task, index: index);
//                               }),
//                         ));
//                       },
//                       background: Container(
//                         color: Colors.red,
//                         padding: EdgeInsets.only(left: 20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.delete,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                       secondaryBackground: Container(
//                         padding: EdgeInsets.only(right: 20.0),
//                         color: Colors.red,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.delete,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                       child: task.isRemindMe
//                           ? TaskTileReminder(
//                               index: index,
//                               title: task.title,
//                               isChecked: task.isChecked,
//                               reminderDate: task.reminderDate,
//                               reminderTime: task.reminderTime,
//                               callback: (newValue) {
//                                 taskData.toggleCheck(task);
//                               },
//                             )
//                           : Center(),
//                     );
//                   },
//                   itemCount: taskData.tasks.length,
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

///
///
///
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/how_to_use.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/screens/settings_screen.dart';
import 'package:todoapp/widgets/TaskListReminder.dart';
import 'package:todoapp/widgets/TileWithoutReminder.dart';
import 'package:todoapp/widgets/TaskList_WithoutReminder.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'app_info_screen.dart';
import 'instructions_screen.dart';

final LocalStorage localStorage = LocalStorage('toDoList.json');

bool initialised = false;
List tasksList = [];
String theme;

class TaskReminderList extends StatefulWidget {
  @override
  _TaskReminderListState createState() => _TaskReminderListState();
}

class _TaskReminderListState extends State<TaskReminderList> {



  /// below is  Banner ads functionality
  BannerAd myBanner1;
  bool isLoaded1 = false;

  void loadBannerAd() {
    myBanner1 = BannerAd(
        adUnitId: 'ca-app-pub-5525086149175557/6486157695',
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isLoaded1 = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();

          print('ad failed to load ${error.message}');
        }));

    myBanner1.load();
  }

  static const AdRequest request = AdRequest();

  /// below is InterstitialAd ads functionality

  InterstitialAd _interstitialAd;

  bool _isAdLoaded = false;

  void _intAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-5525086149175557/8341067364",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
  }


  /// below is InterstitialAd ads functionality

  InterstitialAd _interstitialAd2;

  bool _isAdLoaded2 = false;

  void _intAd2() {
    InterstitialAd.load(
        adUnitId: "a-app-pub-5525086149175557/8528769629",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }

  void onAdLoaded2(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
  }



  Future<bool> get getData async {
    await localStorage.ready;

    if (localStorage != null) {
      theme = await localStorage.getItem('theme');

      tasksList = await localStorage.getItem('todos');
      print(theme);
      print("task list: $tasksList");
      if (tasksList == null) {
        tasksList = [
          // Task(
          //     title: 'This Is A Task, Hold to view details.',
          //     isRemindMe: false),
          // Task(
          //     title: 'Click the + button, to add a new task',
          //     isRemindMe: false),
          // Task(title: 'Check the task, to mark it complete', isRemindMe: false),
          // Task(
          //     title: 'Swipe in any direction to delete the task.',
          //     isRemindMe: false),
        ].map((e) => e.toJson()).toList();
      }
    }

    return true;
  }

  @override
  void initState() {
    /// to load banner ad from google api
    loadBannerAd();

    /// To load interstitial ad from Google API
    _intAd();

    /// this is a timer to display ad after 20 sec of loading this class
    Future.delayed(const Duration(seconds: 20), () {
      /// id ad is loaded then display it w/o error
      if (_isAdLoaded) _interstitialAd.show();
    });


    _intAd2();


    /// this is a timer to display ad after 50 sec of loading this class
    Future.delayed(const Duration(seconds: 55), () {
      /// id ad is loaded then display it w/o error
      if (_isAdLoaded2) _interstitialAd2.show();
    });

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: getData,
          builder: (context, snapshot) {
            print("snapshot: >>>> ${snapshot.data}");

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<TaskData>(
                builder: (context, taskData, child) {
                  if (!initialised) {
                    // if (theme == 'dark') {
                    //   taskData.toggleTheme();
                    // }
                    taskData.init(tasksList);
                    initialised = true;
                  }
                  print(taskData.tasks);

                  if (taskData.tasks.length == 0) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        actions: [
                          GestureDetector(
                            
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "How? ",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'cute',
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HowToUse()))
                              
                            },
                          )
                        ],
                        backgroundColor: Colors.white,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(
                          "Remainder List",
                          style:
                              TextStyle(color: Colors.blue, fontFamily: 'cute'),
                        ),
                      ),
                      body: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: Lottie.asset('assets/taskMan.json'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'There is no Reminder',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'cute',
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Click + button to add Reminder',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'cute',
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Scaffold(
                    backgroundColor: Colors.white,
                    key: _scaffoldKey,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      title: Text(
                        "Reminder List",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontFamily: 'cute',
                            fontSize: 20),
                      ),
                      centerTitle: true,
                      actions: [
                        GestureDetector(


                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "How? ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'cute',
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: ()=>{

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> HowToUse()))

                          },
                        )
                      ],
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final task = taskData.tasks[index];
                              print("taskkkkkk: ${task.isRemindMe}");
                              print("time...: ${task.reminderTime}");

                              return Dismissible(
                                key: UniqueKey(),
                                dismissThresholds: {
                                  DismissDirection.startToEnd: 0.6,
                                  DismissDirection.endToStart: 0.6,
                                },
                                onDismissed: (direction) {
                                  taskData.deleteTask(task);
                                  print("dismiss");
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Item Removed'),
                                    action: SnackBarAction(
                                        label: 'UNDO',
                                        onPressed: () {
                                          taskData.addTask(task, index: index);
                                        }),
                                  ));
                                },
                                background: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                secondaryBackground: Container(
                                  padding: EdgeInsets.only(right: 20.0),
                                  color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                child: task.isRemindMe
                                    ? TaskTileReminder(
                                        index: index,
                                        title: task.title,
                                        isChecked: task.isChecked,
                                        reminderDate: task.reminderDate,
                                        reminderTime: task.reminderTime,
                                        callback: (newValue) {
                                          taskData.toggleCheck(task);
                                        },
                                      )
                                    : Center(),
                              );
                            },
                            itemCount: taskData.tasks.length,
                          ),
                        ),
                        // Container(
                        //     width: MediaQuery.of(context).size.width / 1.2,
                        //     child: SizedBox(height: 80, child: _currentAd)),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: AdWidget(
                ad: myBanner1,
              ),
              width: myBanner1.size.width.toDouble(),
              height: myBanner1.size.height.toDouble(),
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 30, right: 20),
        //   child: Align(
        //     alignment: Alignment.bottomRight,
        //     child: FloatingActionButton.extended(
        //       backgroundColor: const Color(0xff03dac6),
        //       foregroundColor: Colors.black,
        //       onPressed: () {
        //         // Respond to button press
        //       },
        //       icon: Icon(Icons.add),
        //       label: Text('EXTENDED'),
        //     )
        //   ),
        // ),
      ],
    );
  }
}
