import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trello_demo/card/view/card_screen.dart';
import 'package:trello_demo/list/view/widgets/draggable_list.dart';
import 'package:trello_demo/list/view/widgets/list_contrainer.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trello Demo Projects'),
        backgroundColor: Color.fromRGBO(7, 114, 186, 1),
      ),
      body: InkWell(onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: CardScreen()));

                  },child: HorizontalExample()),
    );
  }
}
