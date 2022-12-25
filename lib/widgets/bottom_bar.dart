import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/bottom_bar/fab_bottom_app_bar.dart';
import 'package:todoapp/models/bottom_bar/fab_with_icons.dart';
import 'package:todoapp/models/bottom_bar/layout.dart';

import 'TaskReminder.dart';
import 'package:todoapp/widgets/TaskList_WithoutReminder.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'add_task_screen.dart';
import 'instructions_screen.dart';

class BottomBar extends StatefulWidget {
  static String id = 'tasksScreen';

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setShowTutorial();
  }

  setShowTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('isDone') != null) {
      print("notDone");
    } else {
      print("Done");
      Future.delayed(Duration(seconds: 1), () {
        showTutorial();
      });
    }
  }

  final List<Widget> _children = [
    TaskReminderList(),
    // InstructionsScreen(),
    TasksList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.alarm, text: 'Reminder List'),
          FABBottomAppBarItem(iconData: Icons.list, text: 'Task List'),
          // FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          // FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: buttonForAddTask,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

        prefs.setString("isDone", "True");
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

  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];
  GlobalKey buttonForAddTask = GlobalKey();

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "Target",
        keyTarget: buttonForAddTask,
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
                      "Click + to add task",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "And follow the next Step",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
