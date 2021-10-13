import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class HorizontalExample extends StatefulWidget {
  HorizontalExample({Key? key}) : super(key: key);

  @override
  _HorizontalExample createState() => _HorizontalExample();
}

class InnerList {
  final String name;
  List<String> children;
  InnerList({required this.name, required this.children});
}

class _HorizontalExample extends State<HorizontalExample> {
  late List<InnerList> _lists;
  TextEditingController _cardTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lists = List.generate(5, (outerIndex) {
      return InnerList(
        name: outerIndex.toString(),
        children: List.generate(2, (innerIndex) => 'Fixing Issues'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add List",
                          style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "List Title"),
                          controller: _cardTextController,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _lists.add(InnerList(name:_cardTextController.text.trim() , children: []));
                            print('Tapped');
                            setState(() {
                            });
                          },
                          child: Text("Add List"),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
      ),
      //drawer: NavigationDrawer(),
      body: DragAndDropLists(
        listGhost: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 100.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Icon(Icons.add_box),
            ),
          ),
        ),
        lastItemTargetHeight: 1,
        addLastItemTargetHeightToTop: true,
        itemDivider: Divider(thickness: 4, height: 4, color: Colors.white),
        children: List.generate(_lists.length, (index) => _buildList(index)),
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        axis: Axis.horizontal,
        listWidth: 280,
        listDraggingWidth: 300,
        listInnerDecoration: BoxDecoration(
          color: Color.fromRGBO(38, 171, 226, 1),
          borderRadius: BorderRadius.all(
             Radius.circular(10.0)),
        ),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.blue,
          boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 4)],
        ),
        listDecoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 3.0,
              blurRadius: 6.0,
              offset: Offset(2, 3),
            ),
          ],
        ),
        listPadding: EdgeInsets.all(8.0),
      ),
    );
  }

  _buildList(int outerIndex) {
    var innerList = _lists[outerIndex];
    return DragAndDropList(
      header: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                innerList.name,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      footer: InkWell(
        onTap: (){

            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Card",
                            style:
                            TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(hintText: "Card Title"),
                            controller: _cardTextController,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              innerList.children.add(_cardTextController.text.trim());
                              print('Tapped');
                              setState(() {
                              });
                            },
                            child: Text("Add Card"),
                          ),
                        )
                      ],
                    ),
                  );
                });

        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(7.0)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    '+ Add Card',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leftSide: VerticalDivider(
        color: Colors.white,
        width: 3,
        thickness: 3,
      ),
      rightSide: VerticalDivider(
        color: Colors.white,
        width: 3,
        thickness: 3,
      ),
      children: List.generate(innerList.children.length,
              (index) => _buildItem(innerList.children[index])),
    );
  }

  _buildItem(String item) {
    return DragAndDropItem(
      child: ListTile(
        title: Center(child: Text(item,style: TextStyle(color: Colors.white),)),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
      _lists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _lists.removeAt(oldListIndex);
      _lists.insert(newListIndex, movedList);
    });
  }
}