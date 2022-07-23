import 'package:file_picker/file_picker.dart';

class ImageUploader{
  Future selectFile() async{

    final result= await FilePicker.platform.pickFiles();

  }
  Future uploadFile()async{}




}