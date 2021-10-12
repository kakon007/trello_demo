import 'package:flutter/material.dart';

class FileProvider extends ChangeNotifier {

  String? _imagePath;
  String? _fileExtension;
  String? _fileName;
  int? _fileSize;

  imagePathRecieve(String imagePath,String fileExtension){
    _imagePath=imagePath;
    _fileExtension=fileExtension;
    notifyListeners();
  }

  filePickerPathRecieve(String fileName,int fileSize){
    _fileName=fileName;
    _fileSize=fileSize;
    notifyListeners();
  }

String? get image=>_imagePath;
String? get fileExtension=>_fileExtension;
String? get fileName=>_fileName;
int? get fileSize=>_fileSize;
}