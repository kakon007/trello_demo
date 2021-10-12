import 'package:flutter/material.dart';
import 'package:trello_demo/card/view/widget/add_comment_widget.dart';
import 'package:trello_demo/card/view/widget/attachment_widget.dart';
import 'package:trello_demo/card/view/widget/checkList_widget.dart';
import 'package:trello_demo/card/view/widget/members_widget.dart';
import 'package:trello_demo/card/view/widget/quick_actions_card.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This Project in List Jahid",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            QuickActionCard(),
            MembersWidget(),
            AttachMentWidget(),
            CheckListWidget(),
            AddCommentWidgets()
          ],
        ),
      ),
    );
  }
}
