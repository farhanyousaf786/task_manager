import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'task_info_screen.dart';

class TaskTileWithOutReminder extends StatefulWidget {
  TaskTileWithOutReminder({
    this.title,
    this.isChecked,
    this.callback,
    this.index,
    this.reminderDate,
  });

  final String title;
  final String reminderDate;
  final bool isChecked;
  final Function callback;
  final int index;

  @override
  _TaskTileWithOutReminderState createState() =>
      _TaskTileWithOutReminderState();
}

class _TaskTileWithOutReminderState extends State<TaskTileWithOutReminder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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

              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
                height: 120,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [  Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.campaign,
                                color: Colors.blue,
                              ),
                            ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  widget.title, //60 word
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'cute',
                                      decoration: widget.isChecked
                                          ? TextDecoration.lineThrough
                                          : null,
                                      decorationColor: Colors.red,
                                      fontSize: 15,
                                      color: Colors.blue),
                                ),
                              ),],),

                            Padding(
                              padding: const EdgeInsets.only( right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.isChecked ? "Completed ✔️" : "UpComing",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'cute',
                                        color: widget.isChecked ? Colors.green : Colors.red),
                                  ),
                                ],
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
                                            fontSize: 12,
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
                                            isCheck: false,
                                            index: widget.index,
                                            task: Provider.of<TaskData>(context)
                                                .tasks[widget.index],
                                          );
                                        }));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
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
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 2),
                                            child: Icon(Icons.edit,
                                              size: 12,
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
            ],
          )),
    );
  }
}
