

import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImageService {
  static const int IMAGE_QUALITY = 70;
  static const double MAX_WIDTH = 250, MAX_HEIGHT = 150;

  Future<XFile?> getImage(ImageSource source) async{
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      imageQuality: IMAGE_QUALITY,
      maxHeight: MAX_WIDTH,
      maxWidth: MAX_WIDTH,
    );
    return image;
  }


  String base64(List<int> bytes){
    return base64Encode(bytes);
  }

  Uint8List decodeBase64(String source){
    return base64Decode(source);
  }

}