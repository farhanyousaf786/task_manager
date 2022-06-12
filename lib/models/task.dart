import 'package:flutter/material.dart';

class Task {
  Task(
      {this.title, this.isChecked = false, this.reminderDate, this.reminderId, this.reminderTime, this.isRemindMe});

  final String title;
  bool isChecked;
  final DateTime reminderDate;
  final int reminderId;
  final String reminderTime;
   bool isRemindMe;


  void toggleCheck() {
    isChecked = !isChecked;
  }

  Map toJson() => {
        "title": title,
        "isChecked": isChecked,
        "reminderDate": reminderDate != null ? reminderDate.toString() : null,
        "reminderId": reminderId,
        "reminderTime": reminderTime != null ? reminderTime : null,
        "isRemindMe": isRemindMe,

  };
}
