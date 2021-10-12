import 'dart:ui';

import 'package:flutter/material.dart';

class AddCommentWidgets extends StatefulWidget {
  const AddCommentWidgets({Key? key}) : super(key: key);

  @override
  _AddCommentWidgetsState createState() => _AddCommentWidgetsState();
}

class _AddCommentWidgetsState extends State<AddCommentWidgets> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(38, 171, 226, 1),
      //shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                  radius: 15,
                  child: ClipOval(
                      child: Text('Jk'))
              ),
              Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Add Your Comment",
                      fillColor: Colors.white70),
                ),
              ),
              Icon(Icons.send_outlined),

            ],
          ),
        ),
      ),
    );
  }
}
