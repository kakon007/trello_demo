import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ListContainers extends StatefulWidget {

  @override
  _ListContainersState createState() => _ListContainersState();
}

class _ListContainersState extends State<ListContainers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5,top:20),
      // height: 285,
      // width: 230,
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
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('List Name',style: TextStyle(color: Colors.white),),
            ),
            Column(
                children: List.generate(
                    6,
                        (index) =>  Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10,top:10),
                          //color: Colors.white,
                          height: 60,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(child: Text("Fixing Issues",style: TextStyle(color: Colors.black),)),
                        ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.add,color: Colors.white,size: 20,),
                  SizedBox(width: 5),
                  Text('Add Card',style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),



    );
  }
}
