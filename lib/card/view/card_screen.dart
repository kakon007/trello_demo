import 'package:flutter/material.dart';
import 'package:trello_demo/card/view/widget/add_comment_widget.dart';
import 'package:trello_demo/card/view/widget/card_details_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixing Issues'),
        backgroundColor: Color.fromRGBO(7, 114, 186, 1),
      ),
      body: SingleChildScrollView(child: CardDetailsScreen()),
      //bottomNavigationBar: AddCommentWidgets(),
    );
  }
}
