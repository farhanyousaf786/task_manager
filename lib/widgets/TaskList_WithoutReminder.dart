import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/widgets/TaskListReminder.dart';
import 'package:todoapp/widgets/TileWithoutReminder.dart';

final LocalStorage localStorage = LocalStorage('toDoList.json');

bool initialised = false;
List tasksList = [];
String theme;

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Future<bool> get getData async {
    await localStorage.ready;

    if (localStorage != null) {
      theme = await localStorage.getItem('theme');

      tasksList = await localStorage.getItem('todos');
      print(theme);
      print("task list: $tasksList");
      if (tasksList == null) {
        tasksList = [
          Task(
              title: 'This Is A Task, Hold to view details.',
              isRemindMe: false),
          Task(
              title: 'Click the + button, to add a new task',
              isRemindMe: false),
          Task(title: 'Check the task, to mark it complete', isRemindMe: false),
          Task(
              title: 'Swipe in any direction to delete the task.',
              isRemindMe: false),
        ].map((e) => e.toJson()).toList();
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                if (theme == 'dark') {
                  taskData.toggleTheme();
                }
                taskData.init(tasksList);
                initialised = true;
              }
              print(taskData.tasks);

              if (taskData.tasks.length == 0) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    title: Text(
                      "Task List",
                      style: TextStyle(color: Colors.blue, fontFamily: 'cute'),
                    ),
                    centerTitle: true,

                  ),
                  body:  Column(
                    children: [
                      SizedBox(
                        height: 150,
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
                            'There is no Task',
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
                            'Click + button to add task',
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
              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 35,),
                      Center(
                        child: Text("Task List",
                          style: TextStyle(
                              fontFamily: 'cute',

                              decorationColor: Colors.red,
                              fontSize: 20,
                              color: Colors.blue),),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final task = taskData.tasks[index];

                          return Dismissible(
                            key: UniqueKey(),
                            dismissThresholds: {
                              DismissDirection.startToEnd: 0.6,
                              DismissDirection.endToStart: 0.6,
                            },
                            onDismissed: (direction) {
                              taskData.deleteTask(task);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            child: task.isRemindMe
                                ? Container()
                                : TaskTileWithOutReminder(
                                    index: index,
                                    title: task.title,
                                    isChecked: task.isChecked,
                                    reminderDate: task.reminderDate.toString(),
                                    callback: (newValue) {
                                      taskData.toggleCheck(task);
                                    },
                                  ),
                          );
                        },
                        itemCount: taskData.tasks.length,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
