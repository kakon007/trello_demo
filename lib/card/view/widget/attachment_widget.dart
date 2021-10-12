import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_demo/card/view_model/file_provider.dart';

class AttachMentWidget extends StatefulWidget {
  // String? path;
  // AttachMentWidget({ this.path});

  @override
  _AttachMentWidgetState createState() => _AttachMentWidgetState();
}

class _AttachMentWidgetState extends State<AttachMentWidget> {
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<FileProvider>(context,listen: true);
    print("Image path ${vm.image}");
    return Card(
      color: Color.fromRGBO(38, 171, 226, 1),
      elevation: 2.5,
      child: ExpansionTile(
        //leading: const Icon(Icons.align_horizontal_left),
        title: Text("Attachments",style: TextStyle(color:Colors.black),),
        trailing: const Icon(Icons.attach_file,color: Colors.black,),
        children: [
          vm.image!=null?  Row(children: [
            Icon(Icons.attach_file),
            Text("Image Attachment"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Icon(Icons.more_horiz),
            ),
          ],):SizedBox.shrink(),
          SizedBox(height: 20,),
          vm.image!=null? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 180,
              height:200,
              child:vm.image==null?SizedBox():FittedBox(fit: BoxFit.contain,child: Image.file(File(vm.image!))),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                ],
              ),
            ),
          ):SizedBox.shrink(),
          SizedBox(height: 20,),
          vm.fileName!=null?Row(children: [
            Icon(Icons.attach_file),
            Text("File Attachment"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Icon(Icons.more_horiz),
            ),
          ],):SizedBox.shrink(),
          vm.fileName!=null?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 180,
              height:40,
              child: Center(child: Row(
                children: [
                  Icon(Icons.attach_file),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top:3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(width: 135,child: Text(vm.fileName!,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                        Text("${vm.fileSize} byte".toString(),style: TextStyle(
                          fontSize: 10
                        ),),

                      ],
                    ),
                  ),
                ],
              )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                ],
              ),
            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}
