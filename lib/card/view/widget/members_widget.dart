import 'package:flutter/material.dart';

class MembersWidget extends StatefulWidget {
  const MembersWidget({Key? key}) : super(key: key);

  @override
  _MembersWidgetState createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Color.fromRGBO(38, 171, 226, 1),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.people_alt_outlined),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
                radius: 15,
                child: ClipOval(
                    child: Text('Jk'))
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
                radius: 15,
                child: ClipOval(
                    child: Text('SS'))
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
                radius: 15,
                child: ClipOval(
                    child: Text('II'))
            ),
          ],
        ),
      ),
    );
  }
}
