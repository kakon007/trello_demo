import 'package:flutter/material.dart';

class BoardCards extends StatefulWidget {
  const BoardCards({Key? key}) : super(key: key);

  @override
  _BoardCardsState createState() => _BoardCardsState();
}

class _BoardCardsState extends State<BoardCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5,top:20),
      height: 55,
      width: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(38, 171, 226, 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(38, 171, 226, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(fit: BoxFit.contain,child: Image.network('http://www.polishedpicture.com/wp-content/uploads/2011/12/50pxRoundedCorners.png')),
              )),
          SizedBox(width: 28,),
          Text('Trello Demo Projects',style: TextStyle(
            color: Colors.white,fontSize: 18
          ),),
        ],
      ),
    );
  }
}
