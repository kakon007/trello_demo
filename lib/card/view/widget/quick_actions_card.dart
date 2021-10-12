
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trello_demo/card/view/widget/attachment_widget.dart';
import 'package:trello_demo/card/view_model/file_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuickActionCard extends StatefulWidget {
  const QuickActionCard({Key? key}) : super(key: key);

  @override
  _QuickActionCardState createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard> {

  TextEditingController taskNameController=TextEditingController();
  TextEditingController taskDeadlineController=TextEditingController();
  TextEditingController taskAssigntoController=TextEditingController();
  TextEditingController addMemberController=TextEditingController();

  final picker = ImagePicker();
  File? _image;
  bool isEdit = false;

  TimeOfDay? picked;

  late File file;
  int? filesize;
  String? fileName;

  // static String getFileSizeString({required int bytes, int decimals = 0}) {
  //   const suffixes = ["b", "kb", "mb", "gb", "tb"];
  //   var i = (log(bytes) / log(1024)).floor();
  //   return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  // }
  //
  // Future<File> compressFile(File file) async{
  //   File compressedFile = await FlutterNativeImage.compressImage(file.path,
  //       quality: 91,targetHeight: 800,targetWidth: 600);
  //
  //   print(
  //       'File Path Name::::' + compressedFile.path.toString());
  //   filesize = compressedFile.lengthSync();
  //   print(
  //       'File Path Name::::' + filesize.toString());
  //   print("File size in Kb: "+getFileSizeString(bytes: compressedFile.lengthSync()));
  //   return compressedFile;
  // }

  DateTime selectedDate = DateTime.now();
  DateTime? pickedDate;
  Future<void> _selectDate(BuildContext context) async {
     pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = pickedDate!;
      });
  }

  dateTimeConversion(){
    final now = new DateTime.now();
    return DateTime(now.year, now.month, now.day, picked!.hour, picked!.minute);
  }

  Future getImageUsingCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print("pickedImage ${await _image!.toString()}");
      setState(() {
        isEdit = true;
      });
      //print('ImageName ${_image.toString().split('/').last}');
    } else {
      print('No image selected.');
    }
  }

  Future getImageUsingGallery() async {
    FilePickerResult? result =
    await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpeg', 'jpg','doc'],
    );
    if (result != null) {
      file =await File(result.files.single.path!);
      //compressFile(file);
      setState(() {});
    }
       filesize = file.lengthSync();
      print(
          'File Path Name::::' + filesize.toString());
    fileName=file.path.split('/').last;
    print('FileTapped:::');
  }

  @override
  Widget build(BuildContext context) {

    var vm=Provider.of<FileProvider>(context,listen: true);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromRGBO(38, 171, 226, 1),
      elevation: 2.5,
      child: ExpansionTile(
        //leading: const Icon(Icons.align_horizontal_left),
        title: Text("Quick Actions",style: TextStyle(color:Colors.black),),
        trailing: const Icon(Icons.arrow_downward_outlined,color: Colors.black,),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              InkWell(
                onTap:(){
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            scrollable: false,
                            //title: const Text('Warning'),
                            insetPadding: EdgeInsets.all(10),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: taskNameController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Task Name",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 250,
                                  child: TextField(
                                    controller: taskAssigntoController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Assigned To",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap:() async {
                                        pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: selectedDate,
                                            firstDate: DateTime(2015, 8),
                                            lastDate: DateTime(2101));
                                        if (pickedDate != null && pickedDate != selectedDate)
                                          setState(() {
                                            selectedDate = pickedDate!;
                                          });
                                      },
                                      child: Text("Select Date",style: TextStyle(
                                        color: Colors.blue
                                      ),),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        picked = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                          builder: (BuildContext context, Widget? child) {
                                            return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(alwaysUse24HourFormat: false),
                                              child: child!,
                                            );
                                          },);
                                        setState(() {});
                                        print(picked);
                                      },
                                      child: Text('Select Time',style: TextStyle(
                                        color: Colors.blue
                                      ),),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text('Deadline: '),
                                    Container(
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38
                                        )
                                      ),
                                      child: Center(
                                        child: Text(pickedDate==null?DateFormat("yyyy-MM-dd").format(DateTime.now()):DateFormat("yyyy-MM-dd").format(selectedDate),style: TextStyle( fontSize: 12
                                        ),),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black38
                                          )
                                      ),
                                      child: Center(
                                        child: Text(picked==null?DateFormat("hh:mm a").format(DateTime.now()):DateFormat("hh:mm a").format(dateTimeConversion()),style: TextStyle( fontSize: 12
                                        ),),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Confirm'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(msg: 'Give me API please!!!!!');
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        }
                      );
                    },
                  );
                },
                child: Container(
                  width: 150,
                  height:40,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 12,
                            child: ClipOval(
                                child: Icon(Icons.check,size: 17,))
                        ),
                        SizedBox(width: 20,),
                        Text(
                          'CheckList',
                          // textScaleFactor: 2,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: false,
                        //title: const Text('Warning'),
                        insetPadding: EdgeInsets.all(10),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () async {
                               await getImageUsingCamera();
                               if(_image!=null){
                                 vm.imagePathRecieve(_image!.path, _image!.path.split('.').last);
                                 Navigator.pop(context);
                               }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt),
                                  SizedBox(width: 20,),
                                  Text(
                                    "Take Photo",
                                    textScaleFactor: 0.9,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            InkWell(
                              onTap: () async {
                                await getImageUsingGallery();
                                if(fileName!=null||filesize!=null){
                                  vm.filePickerPathRecieve(fileName!,filesize!);
                                  Navigator.pop(context);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.attach_file),
                                  SizedBox(width: 20,),
                                  Text(
                                    "File",
                                    textScaleFactor: 0.9,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 150,
                  height:40,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 12,
                            child: ClipOval(

                                child: Icon(Icons.attach_file,size: 17,))
                        ),
                        SizedBox(width: 20,),
                        Text(
                          'Attachment',
                          // textScaleFactor: 2,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                    ],
                  ),
                ),
              ),

            ],),
          ),
          InkWell(
            onTap: (){
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          scrollable: false,
                          //title: const Text('Warning'),
                          insetPadding: EdgeInsets.all(10),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 250,
                                child: TextField(
                                  controller: addMemberController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(color: Colors.grey[800]),
                                      hintText: "Search Members",
                                      fillColor: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Confirm'),
                              onPressed: () {
                                Navigator.pop(context);
                                Fluttertoast.showToast(msg: 'Give me API please!!!!!');
                              },
                            ),
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      }
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height:40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 12,
                          child: ClipOval(
                              child: Icon(Icons.people_alt_outlined,size: 17,))
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Members',
                        // textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(7, 114, 186, 1).withOpacity(0.2), spreadRadius: 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Future<void> showAreaErrorPopUp(BuildContext context, String content) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         scrollable: false,
  //         //title: const Text('Warning'),
  //         insetPadding: EdgeInsets.all(10),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             InkWell(
  //               onTap: (){
  //                 getImageUsingCamera();
  //               },
  //               child: Row(
  //                 children: [
  //                   Icon(Icons.camera_alt),
  //                   SizedBox(width: 20,),
  //                   Text(
  //                     "Take Photo",
  //                     textScaleFactor: 0.9,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 15,),
  //             InkWell(
  //               onTap: () async {
  //                await getImageUsingGallery();
  //                 if(_image!=null){
  //                  vm
  //                   Navigator.pop(context);
  //                   setState(() {
  //
  //                   });
  //                 }
  //
  //
  //               },
  //               child: Row(
  //                 children: [
  //                   Icon(Icons.attach_file),
  //                   SizedBox(width: 20,),
  //                   Text(
  //                     "File",
  //                     textScaleFactor: 0.9,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             child: const Text('Cancel'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
