import 'package:flutter/material.dart';
import 'package:trello_demo/board/view/widgets/boards_cards.dart';
import 'package:trello_demo/list/view/list_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boards'),
        backgroundColor: Color.fromRGBO(7, 114, 186, 1),
      ),
      body:ListView.builder(itemCount: 10,itemBuilder: (context,index){
        return InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListScreen()));
        },child: BoardCards());
      })
    );
  }
}
