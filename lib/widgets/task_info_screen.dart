import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'task_edit_screen.dart';
import 'package:todoapp/widgets/option_button.dart';
import '../constants.dart';

class TaskInfoScreen extends StatelessWidget {
  TaskInfoScreen({this.task, this.index, this.isCheck});

  final Task task;
  final int index;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Task Info",
          style: TextStyle(color: Colors.lightBlue, fontFamily: 'cute'),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              'Task Name:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cutes'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${task.title}',
                              style: TextStyle(
                                  color: Colors.lightGreen.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cutes'),
                            ),
                          ],
                        ),
                      ),
                      isCheck
                          ? SizedBox(
                              height: 10.0,
                            )
                          : Container(),
                      isCheck
                          ? Row(
                              children: [
                                Text(
                                  'Task Reminder: ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'cutes'),
                                ),
                                isCheck
                                    ? SizedBox(
                                        width: 10,
                                      )
                                    : Container(),
                                task.reminderDate == null
                                    ? Text("")
                                    : Text(
                                        '${task.reminderDate != null ? DateFormat.yMMMd().format(task.reminderDate) : "Not set"}',
                                        style: TextStyle(
                                            color: Colors.lightGreen.shade700,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'cutes'),
                                      ),
                                task.reminderDate == null
                                    ? Text("")
                                    : Text(
                                        " " +
                                            DateFormat.jm()
                                                .format(task.reminderDate),
                                        style: TextStyle(
                                          fontFamily: 'cute',
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: isCheck ? 100 : 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          OptionButton(
                              title: 'Edit Task',
                              onPressed: () async {
                                await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TaskEditScreen(
                                    task: task,
                                    isCheck: isCheck,
                                  );
                                }));
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
