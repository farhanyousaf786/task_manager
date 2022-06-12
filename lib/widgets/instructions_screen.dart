
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructionTile extends StatelessWidget {
  InstructionTile({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(
        5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: ListTile(
        leading: Icon(
          Icons.adjust,
          size: 25.0,
        ),
        title: Text(title),
      ),
    );
  }
}
