import 'package:flutter/material.dart';

class CheckListWidget extends StatefulWidget {
  const CheckListWidget({Key? key}) : super(key: key);

  @override
  _CheckListWidgetState createState() => _CheckListWidgetState();
}

class _CheckListWidgetState extends State<CheckListWidget> {
  List<String> items = ['Finish Ui Design', 'Add Theme', 'Add Other Functionality'];
  List<String> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(38, 171, 226, 1),
      elevation: 2.5,
      child: ExpansionTile(
        //leading: const Icon(Icons.align_horizontal_left),
        title: Text("Check Lists",style: TextStyle(color:Colors.black),),
        trailing: const Icon(Icons.check,color: Colors.black,),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                ],
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    ...items
                        .map(
                          (item) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckboxListTile(
                        // subtitle: Text('This is a subtitle'),
                        // secondary: Text('This is Secondary text'),
                        title:isChecked.contains(item)?Text(item,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.redAccent),):Text(item),
                        value: isChecked.contains(item),
                        onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  isChecked.add(item);
                                });
                              } else {
                                setState(() {
                                  isChecked.remove(item);
                                  print(isChecked);
                                });
                              }
                        },
                      ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text('Deadline: 21-12-21'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text('Assigned to: Jahid Hasan'),
                              ),
                            ],
                          ),
                    )
                        .toList()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
