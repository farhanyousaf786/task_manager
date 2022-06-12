import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/widgets/instructions_screen.dart';
import 'package:todoapp/widgets/privacy_policy.dart';

class HowToUse extends StatefulWidget {
  @override
  _HowToUseState createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 20.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'How to use',
                style: TextStyle(
                    fontFamily: 'cute', fontSize: 25, color: Colors.blue),
              )),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyPolicy())),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Difference b/w Task Reminder And Task List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'cute', fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Reminder List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green, fontFamily: 'cute', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Reminder List is use to set notification + Alarm for your task with detail",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue, fontFamily: 'cutes', fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Task List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green, fontFamily: 'cute', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Task List is a simple Todo List without any reminder",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue, fontFamily: 'cutes', fontSize: 12),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Instructions",
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'cute', color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InstructionTile(
                        title:
                            'Hold on a task to view information regarding it or edit it.',
                      ),
                      InstructionTile(
                        title: 'Click on the + button to add a new task',
                      ),
                      InstructionTile(
                        title:
                            'Click on the checkbox on the right to mark the task as done',
                      ),
                      InstructionTile(
                        title:
                            'Swipe a task in any direction to delete the task.',
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
