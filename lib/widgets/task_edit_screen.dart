import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/widgets/option_button.dart';

import '../constants.dart';
import '../main.dart';

class TaskEditScreen extends StatefulWidget {
  TaskEditScreen({this.task, this.isCheck});

  final Task task;
  final bool  isCheck;

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final titleController = TextEditingController();

  bool dropDownVal = false;
  DateTime reminderDate;
  String reminderDateString;

  String newTaskTitle;
  DateTime newTaskReminderDate;
  bool newTaskIsChecked;

  @override
  void initState() {
    super.initState();
    titleController.value = TextEditingValue(
      text: widget.task.title,
    );
    newTaskTitle = widget.task.title;
    dropDownVal = widget.task.isChecked;
    newTaskIsChecked = widget.task.isChecked;
    reminderDate = widget.task.reminderDate;
    newTaskReminderDate = reminderDate;
    reminderDateString = reminderDate.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Edit Task",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Task Name: ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cutes'),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: TextField(
                                maxLength: 50,
                                onChanged: (newValue) {
                                  newTaskTitle = newValue;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: titleController,
                                style: kTaskInfoTextStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                    widget.isCheck ?    Row(
                          children: <Widget>[
                            Text(
                              'Edit Reminder: ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'cutes'),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: ElevatedButton(

                                onPressed: () async {
                                  newTaskReminderDate = await showDatePicker(
                                      context: context,
                                      initialDate: reminderDate != null
                                          ? reminderDate
                                          : DateTime.now(),
                                      firstDate: reminderDate != null
                                          ? reminderDate
                                          : DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 2));

                                  if (newTaskReminderDate == null) {
                                    return;
                                  }

                                  TimeOfDay reminderTime = await showTimePicker(
                                      context: context,
                                      initialTime: reminderDate != null
                                          ? TimeOfDay(
                                              hour: reminderDate.hour,
                                              minute: reminderDate.minute,
                                            )
                                          : TimeOfDay(
                                              hour: 0,
                                              minute: 0,
                                            ));

                                  newTaskReminderDate =
                                      newTaskReminderDate.add(Duration(
                                    hours: reminderTime.hour,
                                    minutes: reminderTime.minute,
                                  ));

                                  setState(() {
                                    reminderDateString =
                                        newTaskReminderDate.toString();
                                  });
                                },
                                child: Text(
                                  newTaskReminderDate != null
                                      ? reminderDateString.substring(
                                          0, reminderDateString.length - 7)
                                      : 'Not Set',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ): Container(),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: OptionButton(
                        title: 'Save Changes',
                        onPressed: () async {

                          if(widget.isCheck){
                            if (newTaskTitle == widget.task.title &&
                                newTaskIsChecked == dropDownVal &&
                                newTaskReminderDate == widget.task.reminderDate) {
                              Navigator.pop(context);
                              return;
                            }

                            int id;

                            if (reminderDate != newTaskReminderDate &&
                                newTaskReminderDate != null) {
                              var scheduledNotificationDateTime =
                              newTaskReminderDate
                                  .subtract(Duration(seconds: 5));
                              var androidPlatformChannelSpecifics =
                              AndroidNotificationDetails(
                                newTaskTitle,
                                'To Do Notification',
                                // 'Do the task',
                                priority: Priority.max,
                                importance: Importance.max,
                                playSound: true,
                              );

                              NotificationDetails platformChannelSpecifics =
                              NotificationDetails(
                                  android: androidPlatformChannelSpecifics,
                                  );
                              id = widget.task.reminderId != null
                                  ? widget.task.reminderId
                                  : Provider.of<TaskData>(context, listen: false)
                                  .tasks
                                  .indexOf(widget.task);
                              print(id);

                              await flutterLocalNotificationsPlugin.cancel(id);
                              await flutterLocalNotificationsPlugin.schedule(
                                  id,
                                  'Task reminder',
                                  'It is time for your task: $newTaskTitle',
                                  scheduledNotificationDateTime,
                                  platformChannelSpecifics);
                            }

                            if (widget.task.reminderDate != null &&
                                newTaskReminderDate == null) {
                              await flutterLocalNotificationsPlugin
                                  .cancel(widget.task.reminderId);
                            }

                            String reminderTime;
                            setState(() {
                              reminderTime = reminderDate.hour.toString() +
                                  reminderDate.minute.toString();
                            });

                            Provider.of<TaskData>(context, listen: false)
                                .modifyTask(
                                widget.task,
                                Task(
                                    title: newTaskTitle,
                                    isChecked: dropDownVal,
                                    reminderDate: newTaskReminderDate,
                                    reminderId: id,
                                    isRemindMe: true,
                                    reminderTime: reminderTime));

                            Navigator.pop(context);}else{

                            Provider.of<TaskData>(context, listen: false)
                                .modifyTask(
                                widget.task,
                                Task(
                                    title: newTaskTitle,
                                    isChecked: dropDownVal,
                                    reminderDate: null,
                                    reminderId: null,
                                    isRemindMe: false,
                                    reminderTime: null));

                            Navigator.pop(context);
                          }



                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
